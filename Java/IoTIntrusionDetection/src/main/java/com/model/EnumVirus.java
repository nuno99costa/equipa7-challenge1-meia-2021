package com.model;

public enum EnumVirus implements Comparable<EnumVirus> {
    GAGFYT,
    HAJIME,
    HIDE_AND_SEEK,
    IRCBOT,
    KENJIRO,
    MIRAI,
    MUHSTIK,
    TORII,
    TROJAN;

    public int compare(EnumVirus o1, EnumVirus o2) {
        return o1.toString().compareTo(o2.toString());
    }
}
