package org.engcia.model;

import org.engcia.iotIntrusionDetection.IoTIntrusionDetection;

public class Hypothesis extends Fact{
    private String description;

    public Hypothesis(String description) {
        this.description = description;
        IoTIntrusionDetection.agendaEventListener.addRhs(this);
    }

    public String getDescription() {
        return description;
    }

    public String toString() {
        return (description);
    }
}