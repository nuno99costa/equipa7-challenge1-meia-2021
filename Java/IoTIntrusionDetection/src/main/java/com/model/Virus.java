package com.model;

public class Virus {
    private Connection connection;
    private EnumVirus virus;
    private double cf;

    public Virus(Connection connection, EnumVirus virus, double cf) {
        this.connection = connection;
        this.virus = virus;
        this.cf = cf;
    }

    public Connection getConnection() {
        return connection;
    }
    public EnumVirus getVirus() {
        return virus;
    }
    public double getCf() {
        return cf;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }
    public void setVirus(EnumVirus virus) {
        this.virus = virus;
    }
    public void setCf(double cf) {
        this.cf = cf;
    }

    @Override
    public String toString() {
        return "Virus: { virus=\"" + virus + " (" + cf + ") connection=" + connection + " }";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) { return true; }
        if (o == null || getClass() != o.getClass()) { return false; }
        Virus that = (Virus) o;
        return this.connection.equals(that.connection) && this.virus.compareTo(that.virus) == 0 && this.cf == that.cf;
    }

    @Override
    public int hashCode() {
        return connection.hashCode();
    }
}
