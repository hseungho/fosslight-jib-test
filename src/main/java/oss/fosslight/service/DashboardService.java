/*
 * Copyright (c) 2021 LG Electronics Inc.
 * SPDX-License-Identifier: AGPL-3.0-only 
 */

package oss.fosslight.service;

import java.util.Map;

import oss.fosslight.domain.CommentsHistory;
import oss.fosslight.domain.LicenseMaster;
import oss.fosslight.domain.OssMaster;
import oss.fosslight.domain.Project;

public interface DashboardService {
	Map<String,Object> getDashboardJobsList(Project project);	
	
	Map<String,Object> getDashboardCommentsList(CommentsHistory commentsHistory);  

    Map<String,Object> getDashboardOssList(OssMaster ossMaster);   

    Map<String,Object> getDashboardLicenseList(LicenseMaster licenseMaster);   
    
    void readConfirmAll(CommentsHistory commentsHistory);
}
