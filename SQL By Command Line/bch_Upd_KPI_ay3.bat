@echo off
sqlcmd -S THAY-S-DB02 -d KPIDB_AY3 -U kpidbdev -P "k9qumMI+" -Q "EXEC sps_EMB_DashData_date 'TH05'"
:exit