package org.engcia.model;

public class Evidence extends Fact{
    public static final String CONN_STATE =
            "Connection state (conn_state)?";
    public static final String DURATION =
            "Connection duration (duration)?";
    public static final String HISTORY =
            "History of connections (history)?";
    public static final String ID_ORIG_P =
            "Port used by the originator (id_orig_p)?";
    public static final String ID_RESP_P =
            "Port used by the responder (id_resp_p)?";
    public static final String MISSED_BYTES =
            "Number of bytes missed in content gaps (missed_bytes)?";
    public static final String ORIG_BYTES =
            "Number of payload bytes sent by the originator (orig_bytes)?";
    public static final String ORIG_IP_BYTES =
            "Number of IP level bytes sent by the originator (orig_ip_bytes)";
    public static final String ORIG_PKTS =
            "Number of packets sent by the originator (orig_pkts)?";
    public static final String RESP_BYTES =
            "Number of payload bytes sent by the responder (resp_bytes)?";
    public static final String RESP_IP_BYTES =
            "Number of IP level bytes sent by the responder (resp_ip_bytes)";
    public static final String RESP_PKTS =
            "Number of packets sent by the responder (resp_pkts)?";
    public static final String SERVICE =
            "Protocol used (service)?";

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

