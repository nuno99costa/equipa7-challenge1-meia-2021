package com;

import java.util.*;

import com.model.Connection;
import com.model.EnumVirus;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
import org.kie.api.runtime.ObjectFilter;
import org.kie.api.runtime.rule.FactHandle;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.Virus;

@Service
public class IotIntrusionDetectionService {

    private static Logger log = LoggerFactory.getLogger(IotIntrusionDetectionService.class);

    private final KieContainer kieContainer;

    @Autowired
    public IotIntrusionDetectionService(KieContainer kieContainer) {
        log.info("Initialising a new IoT Intrusion Detection session.");
        this.kieContainer = kieContainer;
    }

    public Map<EnumVirus, Double> getVirusList(Connection connection) {
        KieSession kieSession = kieContainer.newKieSession("IoTIntrusionDetectionSession");
        kieSession.insert(connection);
        kieSession.fireAllRules();
        Map<EnumVirus, Double> map = findirusList(kieSession);
        kieSession.dispose();
        return map;
    }

    private Map<EnumVirus, Double> findirusList(KieSession kieSession) {
        
        ObjectFilter IoTIntrusionDetectionFilter = new ObjectFilter() {
            @Override
            public boolean accept(Object object) {
                if (Virus.class.equals(object.getClass())) return true;
                return false;
            }
        };

        // printFactsMessage(kieSession);
        
        List<Virus> facts = new ArrayList<Virus>();
        for (FactHandle handle : kieSession.getFactHandles(IoTIntrusionDetectionFilter)) {
            facts.add((Virus) kieSession.getObject(handle));
        }
        if (facts.size() == 0) {
            return null;
        }

        Map<EnumVirus, Double> map = new HashMap<EnumVirus, Double>();
        for(EnumVirus ev: EnumVirus.values()){
            boolean found = false;
            double cf = 0;
            for(Virus v: facts)
                if(v.getVirus().equals(ev)) {
                    found = true;
                    if (v.getCf() > cf)
                        cf = v.getCf();
                }
            if(found)
                map.put(ev, cf);
        }

        Map<EnumVirus, Double> sortedMap = new TreeMap<EnumVirus, Double>(map);

        return sortedMap;
    }

    private void printFactsMessage(KieSession kieSession) {
        Collection<FactHandle> allHandles = kieSession.getFactHandles();
        
        String msg = "\nAll facts:\n";
        for (FactHandle handle : allHandles) {
            msg += "    " + kieSession.getObject(handle) + "\n";
        }
        System.out.println(msg);
    }

}
