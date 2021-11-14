package org.engcia.view;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Collection;

import org.kie.api.runtime.ClassObjectFilter;

import org.engcia.iotIntrusionDetection.IoTIntrusionDetection;
import org.engcia.model.Evidence;

public class UI {
    private static BufferedReader br;

    public static void uiInit() {
        br = new BufferedReader(new InputStreamReader(System.in));
    }

    public static void uiClose() {
        if (br != null) {
            try {
                br.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static boolean answer(String ev, String operator, double v) {
        @SuppressWarnings("unchecked")
        Collection<Evidence> evidences = (Collection<Evidence>) IoTIntrusionDetection.KS.getObjects(new ClassObjectFilter(Evidence.class));
        boolean questionFound = false;
        Evidence evidence = null;
        for (Evidence e : evidences) {
            if (e.getEvidence().compareTo(ev) == 0) {
                questionFound = true;
                evidence = e;
                break;
            }
        }
        if (questionFound) {
            double value = Double.parseDouble(evidence.getValue());
            if (ev(value, operator, v)) {
                IoTIntrusionDetection.agendaEventListener.addLhs(evidence);
                return true;
            } else {
                return false;
            }
        }

        System.out.print(ev + "? ");
        String value = readLine();

        Evidence e = new Evidence(ev, value);
        IoTIntrusionDetection.KS.insert(e);

        if (ev(Double.parseDouble(value), operator, v)) {
            IoTIntrusionDetection.agendaEventListener.addLhs(e);
            return true;
        } else {
            return false;
        }
    }

    public static boolean answer(String ev, String v) {
        @SuppressWarnings("unchecked")
        Collection<Evidence> evidences = (Collection<Evidence>) IoTIntrusionDetection.KS.getObjects(new ClassObjectFilter(Evidence.class));
        boolean questionFound = false;
        Evidence evidence = null;
        for (Evidence e: evidences) {
            if (e.getEvidence().compareTo(ev) == 0) {
                questionFound = true;
                evidence = e;
                break;
            }
        }
        if (questionFound) {
            if (evidence.getValue().compareTo(v) == 0) {
                IoTIntrusionDetection.agendaEventListener.addLhs(evidence);
                return true;
            } else {
                return false;
            }
        }
        System.out.print(ev + "? ");
        String value = readLine();

        Evidence e = new Evidence(ev, value);
        IoTIntrusionDetection.KS.insert(e);

        if (value.compareTo(v) == 0) {
            IoTIntrusionDetection.agendaEventListener.addLhs(e);
            return true;
        } else {
            return false;
        }
    }

    private static String readLine() {
        String input = "";

        try {
            input = br.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return input;
    }

    public static boolean ev(double value1, String op, double value2){
        switch (op) {
            case ">":
                return value1 > value2;
            case ">=":
                return value1 >= value2;
            case "<":
                return value1 < value2;
            case "<=":
                return value1 <= value2;
            case "==":
                return value1 == value2;
            case "!=":
                return value1 != value2;
            default:
                return false;
        }
    }

}
