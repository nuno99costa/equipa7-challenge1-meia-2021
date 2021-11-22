package com;

import com.model.EnumVirus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.model.Connection;

import java.util.Map;

@RestController
public class IotIntrusionDetectionController {

    private static Logger log = LoggerFactory.getLogger(IotIntrusionDetectionController.class);

    private final IotIntrusionDetectionService iotIntrusionDetectionService;

    @Autowired
    public IotIntrusionDetectionController(IotIntrusionDetectionService iotIntrusionDetectionService) {
        this.iotIntrusionDetectionService = iotIntrusionDetectionService;
    }

    @CrossOrigin
    @RequestMapping(value = "/iotintrusiondetection",
            method = RequestMethod.GET, produces = "application/json")
    public Map<EnumVirus, Double> getVirusList(
            @RequestParam(required = true) String conn_state,
            @RequestParam(required = true) double duration,
            @RequestParam(required = true) int history,
            @RequestParam(required = true) int id_orig_p,
            @RequestParam(required = true) int id_resp_p,
            @RequestParam(required = true) int missed_bytes,
            @RequestParam(required = true) int orig_bytes,
            @RequestParam(required = true) int orig_ip_bytes,
            @RequestParam(required = true) int orig_pkts,
            @RequestParam(required = true) int resp_bytes,
            @RequestParam(required = true) int resp_ip_bytes,
            @RequestParam(required = true) int resp_pkts,
            @RequestParam(required = true) String service) {

        Connection connection = new Connection(conn_state, duration, history, id_orig_p, id_resp_p, missed_bytes,
                orig_bytes, orig_ip_bytes, orig_pkts, resp_bytes, resp_ip_bytes, resp_pkts, service);

        log.debug("IoT Intrusion Detection request received for: " + connection);

        Map<EnumVirus, Double> map = iotIntrusionDetectionService.getVirusList(connection);

        return map;
    }

}
