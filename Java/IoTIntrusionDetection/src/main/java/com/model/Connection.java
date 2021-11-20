package com.model;

public class Connection {

    private String conn_state;
    private double dur;
    private int history;
    private int id_orig_p;
    private int id_resp_p;
    private int missed_bytes;
    private int orig_bytes;
    private int orig_ip_bytes;
    private int orig_pkts;
    private int resp_bytes;
    private int resp_ip_bytes;
    private int resp_pkts;
    private String service;

    public Connection(String conn_state, double duration, int history, int id_orig_p, int id_resp_p, int missed_bytes,
                      int orig_bytes, int orig_ip_bytes, int orig_pkts, int resp_bytes, int resp_ip_bytes,
                      int resp_pkts, String service){
        this.conn_state = conn_state;
        this.dur = duration;
        this.history = history;
        this.id_orig_p = id_orig_p;
        this.id_resp_p = id_resp_p;
        this.missed_bytes = missed_bytes;
        this.orig_bytes = orig_bytes;
        this.orig_pkts = orig_pkts;
        this.orig_ip_bytes = orig_ip_bytes;
        this.resp_bytes = resp_bytes;
        this.resp_ip_bytes = resp_ip_bytes;
        this.resp_pkts = resp_pkts;
        this.service = service;
    }

    public String getConn_state() {
        return conn_state;
    }

    public void setConn_state(String conn_state) {
        this.conn_state = conn_state;
    }

    public double getDur() {
        return dur;
    }

    public void setDur(double dur) {
        this.dur = dur;
    }

    public int getHistory() {
        return history;
    }

    public void setHistory(int history) {
        this.history = history;
    }

    public int getId_orig_p() {
        return id_orig_p;
    }

    public void setId_orig_p(int id_orig_p) {
        this.id_orig_p = id_orig_p;
    }

    public int getId_resp_p() {
        return id_resp_p;
    }

    public void setId_resp_p(int id_resp_p) {
        this.id_resp_p = id_resp_p;
    }

    public int getMissed_bytes() {
        return missed_bytes;
    }

    public void setMissed_bytes(int missed_bytes) {
        this.missed_bytes = missed_bytes;
    }

    public int getOrig_bytes() {
        return orig_bytes;
    }

    public void setOrig_bytes(int orig_bytes) {
        this.orig_bytes = orig_bytes;
    }

    public int getOrig_ip_bytes() {
        return orig_ip_bytes;
    }

    public void setOrig_ip_bytes(int orig_ip_bytes) {
        this.orig_ip_bytes = orig_ip_bytes;
    }

    public int getOrig_pkts() {
        return orig_pkts;
    }

    public void setOrig_pkts(int orig_pkts) {
        this.orig_pkts = orig_pkts;
    }

    public int getResp_bytes() {
        return resp_bytes;
    }

    public void setResp_bytes(int resp_bytes) {
        this.resp_bytes = resp_bytes;
    }

    public int getResp_ip_bytes() {
        return resp_ip_bytes;
    }

    public void setResp_ip_bytes(int resp_ip_bytes) {
        this.resp_ip_bytes = resp_ip_bytes;
    }

    public int getResp_pkts() {
        return resp_pkts;
    }

    public void setResp_pkts(int resp_pkts) {
        this.resp_pkts = resp_pkts;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    @Override
    public String toString() {
        return "Connection: { conn_state=\"" + conn_state + "\"" + ", duration=" + dur +
                ", history=" + history + ", id_orig_p=" + id_orig_p + ", id_resp_p=" + id_resp_p
                + ", missed_bytes=" + missed_bytes + ", orig_bytes=" + orig_bytes +
                ", orig_pkts=" + orig_pkts + ", orig_ip_bytes=" + orig_ip_bytes + ", resp_bytes=" + resp_bytes
                + ", resp_ip_bytes=" + resp_ip_bytes + ", resp_pkts=" + resp_pkts + ", service=" + service + " }";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Connection that = (Connection) o;
        return dur == that.dur && history == that.history && id_orig_p == that.id_orig_p &&
                id_resp_p == that.id_resp_p && missed_bytes == that.missed_bytes &&
                orig_bytes == that.orig_bytes && orig_ip_bytes == that.orig_ip_bytes &&
                orig_pkts == that.orig_pkts && resp_bytes == that.resp_bytes &&
                resp_ip_bytes == that.resp_ip_bytes && resp_pkts == that.resp_pkts &&
                conn_state.compareTo(that.conn_state) == 0 && service.compareTo(that.service) == 0;
    }

}
