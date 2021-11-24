package com.model;

public class Connection {

    private String conn_state;
    private Double dur;
    private Integer history;
    private Integer id_orig_p;
    private Integer id_resp_p;
    private Integer missed_bytes;
    private Integer orig_bytes;
    private Integer orig_ip_bytes;
    private Integer orig_pkts;
    private Integer resp_bytes;
    private Integer resp_ip_bytes;
    private Integer resp_pkts;
    private String service;

    public Connection(String conn_state, Double duration, Integer history, Integer id_orig_p, Integer id_resp_p, Integer missed_bytes,
                      Integer orig_bytes, Integer orig_ip_bytes, Integer orig_pkts, Integer resp_bytes, Integer resp_ip_bytes,
                      Integer resp_pkts, String service){
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

    public Double getDur() {
        return dur;
    }

    public void setDur(Double dur) {
        this.dur = dur;
    }

    public Integer getHistory() {
        return history;
    }

    public void setHistory(Integer history) {
        this.history = history;
    }

    public Integer getId_orig_p() {
        return id_orig_p;
    }

    public void setId_orig_p(Integer id_orig_p) {
        this.id_orig_p = id_orig_p;
    }

    public Integer getId_resp_p() {
        return id_resp_p;
    }

    public void setId_resp_p(Integer id_resp_p) {
        this.id_resp_p = id_resp_p;
    }

    public Integer getMissed_bytes() {
        return missed_bytes;
    }

    public void setMissed_bytes(Integer missed_bytes) {
        this.missed_bytes = missed_bytes;
    }

    public Integer getOrig_bytes() {
        return orig_bytes;
    }

    public void setOrig_bytes(Integer orig_bytes) {
        this.orig_bytes = orig_bytes;
    }

    public Integer getOrig_ip_bytes() {
        return orig_ip_bytes;
    }

    public void setOrig_ip_bytes(Integer orig_ip_bytes) {
        this.orig_ip_bytes = orig_ip_bytes;
    }

    public Integer getOrig_pkts() {
        return orig_pkts;
    }

    public void setOrig_pkts(Integer orig_pkts) {
        this.orig_pkts = orig_pkts;
    }

    public Integer getResp_bytes() {
        return resp_bytes;
    }

    public void setResp_bytes(Integer resp_bytes) {
        this.resp_bytes = resp_bytes;
    }

    public Integer getResp_ip_bytes() {
        return resp_ip_bytes;
    }

    public void setResp_ip_bytes(Integer resp_ip_bytes) {
        this.resp_ip_bytes = resp_ip_bytes;
    }

    public Integer getResp_pkts() {
        return resp_pkts;
    }

    public void setResp_pkts(Integer resp_pkts) {
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
