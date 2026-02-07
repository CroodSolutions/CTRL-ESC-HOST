# Requires:
# Connect-MgGraph -Scopes "DeviceManagementConfiguration.ReadWrite.All"
# Install-Module Microsoft.Graph -Scope CurrentUser

#Settings to Apply
$settingsGetJson = @'
{
    "@odata.context": "https://graph.microsoft.com/beta/$metadata#deviceManagement/configurationPolicies('2eacf2ff-9429-445c-afe7-7e3b434b3abf')/settings",
    "@odata.count": 23,
    "@microsoft.graph.tips": "Use $select to choose only the properties your app needs, as this can lead to performance improvements. For example: GET deviceManagement/configurationPolicies('<guid>')/settings?$select=settingInstance,id",
    "value": [
        {
            "id": "0",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance",
                "settingDefinitionId": "device_vendor_msft_accountmanagement_userprofilemanagement_profileinactivitythreshold",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "simpleSettingValue": {
                    "@odata.type": "#microsoft.graph.deviceManagementConfigurationIntegerSettingValue",
                    "settingValueTemplateReference": null,
                    "value": 30
                }
            }
        },
        {
            "id": "1",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_printers_approvedusbprintdevices",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_printers_approvedusbprintdevices_1",
                    "children": [
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_printers_approvedusbprintdevices_approvedusbprintdevices_list",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "simpleSettingValue": {
                                "@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
                                "settingValueTemplateReference": null,
                                "value": ""
                            }
                        }
                    ]
                }
            }
        },
        {
            "id": "2",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_admx_filesys_disablecompression",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_admx_filesys_disablecompression_1",
                    "children": []
                }
            }
        },
        {
            "id": "3",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "user_vendor_msft_policy_config_admx_shellcommandpromptregedittools_disablecmd",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "user_vendor_msft_policy_config_admx_shellcommandpromptregedittools_disablecmd_1",
                    "children": [
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "user_vendor_msft_policy_config_admx_shellcommandpromptregedittools_disablecmd_disablecmdscripts",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "user_vendor_msft_policy_config_admx_shellcommandpromptregedittools_disablecmd_disablecmdscripts_1",
                                "children": []
                            }
                        }
                    ]
                }
            }
        },
        {
            "id": "4",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_admx_removablestorage_removabledisks_denyexecute_access_2",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_admx_removablestorage_removabledisks_denyexecute_access_2_1",
                    "children": []
                }
            }
        },
        {
            "id": "5",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_admx_removablestorage_removabledisks_denyread_access_2",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_admx_removablestorage_removabledisks_denyread_access_2_1",
                    "children": []
                }
            }
        },
        {
            "id": "6",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_1",
                    "children": [
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_windowsfeedbackhub",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_windowsfeedbackhub_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_microsoftofficehub",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_microsoftofficehub_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_clipchamp",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_clipchamp_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_copilot",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_copilot_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_bingnews",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_bingnews_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_photos",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_photos_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_microsoftsolitairecollection",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_microsoftsolitairecollection_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_microsoftstickynotes",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_microsoftstickynotes_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_msteams",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_msteams_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_todo",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_todo_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_bingweather",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_bingweather_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_outlookforwindows",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_outlookforwindows_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_paint",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_paint_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_quickassist",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_quickassist_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_screensketch",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_screensketch_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_windowscalculator",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_windowscalculator_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_windowscamera",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_windowscamera_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_mediaplayer",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_mediaplayer_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_windowsnotepad",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_windowsnotepad_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_windowssoundrecorder",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_windowssoundrecorder_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_windowsterminal",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_windowsterminal_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_gamingapp",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_gamingapp_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_xboxidentityprovider",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_xboxidentityprovider_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_xboxspeechtotextoverlay",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_xboxspeechtotextoverlay_1",
                                "children": []
                            }
                        },
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_xboxtcui",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_applicationmanagement_removedefaultmicrosoftstorepackages_xboxtcui_1",
                                "children": []
                            }
                        }
                    ]
                }
            }
        },
        {
            "id": "7",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_admx_powershellexecutionpolicy_enablescripts",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_admx_powershellexecutionpolicy_enablescripts_1",
                    "children": [
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_admx_powershellexecutionpolicy_enablescripts_executionpolicy",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "device_vendor_msft_policy_config_admx_powershellexecutionpolicy_enablescripts_executionpolicy_remotesigned",
                                "children": []
                            }
                        }
                    ]
                }
            }
        },
        {
            "id": "8",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "user_vendor_msft_policy_config_admx_powershellexecutionpolicy_enablescripts",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "user_vendor_msft_policy_config_admx_powershellexecutionpolicy_enablescripts_1",
                    "children": [
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                            "settingDefinitionId": "user_vendor_msft_policy_config_admx_powershellexecutionpolicy_enablescripts_executionpolicy",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "choiceSettingValue": {
                                "settingValueTemplateReference": null,
                                "value": "user_vendor_msft_policy_config_admx_powershellexecutionpolicy_enablescripts_executionpolicy_allsigned",
                                "children": []
                            }
                        }
                    ]
                }
            }
        },
        {
            "id": "9",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_experience_donotshowfeedbacknotifications",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_experience_donotshowfeedbacknotifications_1",
                    "children": []
                }
            }
        },
        {
            "id": "10",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome_urlallowlist",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome_urlallowlist_1",
                    "children": [
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingCollectionInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome_urlallowlist_urlallowlistdesc",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "simpleSettingCollectionValue": [
                                {
                                    "@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
                                    "settingValueTemplateReference": null,
                                    "value": "croodsolutions.com"
                                }
                            ]
                        }
                    ]
                }
            }
        },
        {
            "id": "11",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome_urlblocklist",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome_urlblocklist_1",
                    "children": [
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingCollectionInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome_urlblocklist_urlblocklistdesc",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "simpleSettingCollectionValue": [
                                {
                                    "@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
                                    "settingValueTemplateReference": null,
                                    "value": "*"
                                }
                            ]
                        }
                    ]
                }
            }
        },
        {
            "id": "12",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome_bookmarkbarenabled",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome_bookmarkbarenabled_0",
                    "children": []
                }
            }
        },
        {
            "id": "13",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome_importbookmarks",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome_importbookmarks_0",
                    "children": []
                }
            }
        },
        {
            "id": "14",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome_importhistory",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome_importhistory_0",
                    "children": []
                }
            }
        },
        {
            "id": "15",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome_importhomepage",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome_importhomepage_0",
                    "children": []
                }
            }
        },
        {
            "id": "16",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome_ntpcardsvisible",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome_ntpcardsvisible_0",
                    "children": []
                }
            }
        },
        {
            "id": "17",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome~startup_homepageisnewtabpage",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome~startup_homepageisnewtabpage_1",
                    "children": []
                }
            }
        },
        {
            "id": "18",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome_recommended~defaultsearchprovider_recommended_defaultsearchproviderenabled_recommended",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_chromeintunev1~policy~googlechrome_recommended~defaultsearchprovider_recommended_defaultsearchproviderenabled_recommended_0",
                    "children": []
                }
            }
        },
        {
            "id": "19",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_applicationmanagement_requireprivatestoreonly",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_applicationmanagement_requireprivatestoreonly_1",
                    "children": []
                }
            }
        },
        {
            "id": "20",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge_importfavorites",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge_importfavorites_0",
                    "children": []
                }
            }
        },
        {
            "id": "21",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge_editfavoritesenabled",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge_editfavoritesenabled_0",
                    "children": []
                }
            }
        },
        {
            "id": "22",
            "settingInstance": {
                "@odata.type": "#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance",
                "settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge_urlblocklist",
                "settingInstanceTemplateReference": null,
                "auditRuleInformation": null,
                "choiceSettingValue": {
                    "settingValueTemplateReference": null,
                    "value": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge_urlblocklist_1",
                    "children": [
                        {
                            "@odata.type": "#microsoft.graph.deviceManagementConfigurationSimpleSettingCollectionInstance",
                            "settingDefinitionId": "device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge_urlblocklist_urlblocklistdesc",
                            "settingInstanceTemplateReference": null,
                            "auditRuleInformation": null,
                            "simpleSettingCollectionValue": [
                                {
                                    "@odata.type": "#microsoft.graph.deviceManagementConfigurationStringSettingValue",
                                    "settingValueTemplateReference": null,
                                    "value": "*"
                                }
                            ]
                        }
                    ]
                }
            }
        }
    ]
}
'@

# Convert to an object
$settingsGetObj = $settingsGetJson | ConvertFrom-Json

# The GET response has a "value" array. Convert each entry into the POST format.
$settingsForPost = foreach ($item in $settingsGetObj.value) {
    @{
        "@odata.type"   = "#microsoft.graph.deviceManagementConfigurationSetting"
        settingInstance = $item.settingInstance
    }
}

# Build the POST body for policy creation
$body = @{
    name         = "Kiosk Hardening - Base"
    description  = "Baseline kiosk hardening settings."
    platforms    = "windows10"
    technologies = "mdm"
    settings     = $settingsForPost     # NOTE: lowercase "settings"
}

# Convert to JSON (Depth must be high because settings are deeply nested)
$jsonBody = $body | ConvertTo-Json -Depth 100

# OPTIONAL: sanity check JSON validity
$jsonBody | ConvertFrom-Json | Out-Null

# Now you can POST with either Invoke-MgGraphRequest or Invoke-RestMethod
Invoke-MgGraphRequest -Method POST `
  -Uri "https://graph.microsoft.com/beta/deviceManagement/configurationPolicies" `
  -Body $jsonBody `
  -ContentType "application/json"