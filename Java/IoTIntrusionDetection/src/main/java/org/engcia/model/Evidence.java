package org.engcia.model;

public class Evidence extends Fact{
    public static final String CONN_STATE = "conn_state"; //"There is blood in the ear";
    public static final String DURATION = "duration"; //"Do you have earache";
    public static final String HISTORY = "history"; //"Do you have deafness";
    public static final String ID_ORIG_P = "id_orig_p"; //"Is there crebrospinal fluid spill";
    public static final String ID_RESP_P = "id_resp_p"; //"Do you have headache";
    public static final String MISSED_BYTES = "missed_bytes"; //"Is there blood in the nose";
    public static final String ORIG_BYTES = "orig_bytes"; //"Is there blood in the mouth";
    public static final String ORIG_IP_BYTES = "orig_ip_bytes"; //"Is the blood colour dark brown";
    public static final String ORIG_PKTS = "orig_pkts"; //"Is there vomiting";
    public static final String RESP_BYTES = "resp_bytes"; //"Is there blood in the vagina";
    public static final String RESP_IP_BYTES = "resp_ip_bytes"; //"Is there blood in the penis";
    public static final String RESP_PKTS = "resp_pkts"; //"Is there blood in the anus";
    public static final String SERVICE = "service"; //"Has the blood in the anus the apperance of coffee grounds";

    private String evidence;
    private String value;

    public Evidence(String ev, String v) {
        evidence = ev;
        value = v;
    }

    public String getEvidence() {
        return evidence;
    }

    public String getValue() { return value; }

    public String toString() { return (evidence + " = " + value); }

}

