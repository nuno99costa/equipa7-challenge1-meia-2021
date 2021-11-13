package org.engcia.model;

import org.engcia.iotIntrusionDetection.IoTIntrusionDetection;

public class Conclusion extends Fact{
    public static final String MIRAI = "Mirai";
    public static final String TORII = "Torii";
    public static final String TROJAN = "Trojan";
    public static final String GAGFYT = "Gagfyt";
    public static final String HIDE_AND_SEEK = "Hide and Seek";
    public static final String HAJIME = "Hajime";
    public static final String KENJIRO = "Kenjiro";
    public static final String IRCBOT = "IRCBot";
    public static final String MUHSTIK = "Muhstik";

    private String description;
    private double cf;

    public Conclusion(String description, double cf) {
        this.description = description;
        this.cf = cf;
        IoTIntrusionDetection.agendaEventListener.addRhs(this);
    }

    public String getDescription() {
        return description;
    }

    public String toString() {
        return ("Conclusion: " + description + " ("+cf+")");
    }

}
