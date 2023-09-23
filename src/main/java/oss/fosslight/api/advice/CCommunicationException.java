/*
 * Copyright (c) 2021 LG Electronics Inc.
 * SPDX-License-Identifier: AGPL-3.0-only 
 */

package oss.fosslight.api.advice;

public class CCommunicationException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;
    
    public CCommunicationException(String msg, Throwable t) {
        super(msg, t);
    }
    
    public CCommunicationException(String msg) {
        super(msg);
    }
    
    public CCommunicationException() {
        super();
    }
}
