// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gordondickens.springformatter.entity;

import java.lang.String;

privileged aspect SocialSecurityNumber_Roo_ToString {
    
    public String SocialSecurityNumber.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Prefix: ").append(getPrefix()).append(", ");
        sb.append("Middle: ").append(getMiddle()).append(", ");
        sb.append("Suffix: ").append(getSuffix());
        return sb.toString();
    }
    
}
