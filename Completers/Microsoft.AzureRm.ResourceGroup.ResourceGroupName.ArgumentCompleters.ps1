$ScriptBlock = {
        <#
        .SYNOPSIS
        Auto-complete the -ResourceGroupName parameter value for Azure Resource Manager (ARM) PowerShell cmdlets.

        .NOTES
        Created by Trevor Sullivan <trevor@trevorsullivan.net>
        http://trevorsullivan.net
        #>
        param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)

        $CacheKey = 'ResourceGroup_ResourceGroupNameCache';
        $Cache = Get-CompletionPrivateData -Key $CacheKey;
        if ($Cache) {
            return $Cache;
        }

        try {
            $ResourceGroupList = Get-AzureRmResourceGroup -ErrorAction Stop;
        } catch {
            Write-Host -Object ('Error occurred retrieving resource groups: {0}' -f $PSItem.Exception.Message);
        }
        $ItemList = $ResourceGroupList | Where-Object { $PSItem.ResourceGroupName -match $wordToComplete } | ForEach-Object {
            $CompletionResult = @{
                CompletionText = $PSItem.ResourceGroupName;
                ToolTip = 'Resource Group {0} in {1} region.' -f $PSItem.ResourceGroupName, $PSItem.Location;
                ListItemText = '{0} ({1})' -f $PSItem.ResourceGroupName, $PSItem.Location;
                CompletionResultType = [System.Management.Automation.CompletionResultType]::ParameterValue;
                NoQuotes = $true;
                }
            New-CompletionResult @CompletionResult;
        }
        Set-CompletionPrivateData -Key $CacheKey -Value $ItemList;

        return $ItemList
    }

$ArgumentCompleter = @{
        CommandName = @(
            'Get-AzureRMSqlDatabaseServerAuditingPolicy'
            'Remove-AzureRMSqlDatabaseServerAuditing'
            'Set-AzureRMSqlDatabaseServerAuditingPolicy'
            'Use-AzureRMSqlDatabaseServerAuditingPolicy'
            'Add-AzureRMVhd'
            'Backup-AzureRMApiManagement'
            'Disable-AzureRMTrafficManagerEndpoint'
            'Disable-AzureRMTrafficManagerProfile'
            'Enable-AzureRMTrafficManagerEndpoint'
            'Enable-AzureRMTrafficManagerProfile'
            'Export-AzureRMAutomationDscConfiguration'
            'Export-AzureRMAutomationDscNodeReportContent'
            'Export-AzureRMAutomationRunbook'
            'Get-AzureRMApiManagement'
            'Get-AzureRMApiManagementSsoToken'
            'Get-AzureRMApplicationGateway'
            'Get-AzureRMAppServicePlan'
            'Get-AzureRMAutomationAccount'
            'Get-AzureRMAutomationCertificate'
            'Get-AzureRMAutomationConnection'
            'Get-AzureRMAutomationCredential'
            'Get-AzureRMAutomationDscCompilationJob'
            'Get-AzureRMAutomationDscCompilationJobOutput'
            'Get-AzureRMAutomationDscConfiguration'
            'Get-AzureRMAutomationDscNode'
            'Get-AzureRMAutomationDscNodeConfiguration'
            'Get-AzureRMAutomationDscNodeReport'
            'Get-AzureRMAutomationDscOnboardingMetaconfig'
            'Get-AzureRMAutomationJob'
            'Get-AzureRMAutomationJobOutput'
            'Get-AzureRMAutomationModule'
            'Get-AzureRMAutomationRegistrationInfo'
            'Get-AzureRMAutomationRunbook'
            'Get-AzureRMAutomationSchedule'
            'Get-AzureRMAutomationScheduledRunbook'
            'Get-AzureRMAutomationVariable'
            'Get-AzureRMAutomationWebhook'
            'Get-AzureRMAvailabilitySet'
            'Get-AzureRMBackupVault'
            'Get-AzureRMBatchAccount'
            'Get-AzureRMBatchAccountKeys'
            'Get-AzureRMDataFactory'
            'Get-AzureRMDataFactoryDataset'
            'Get-AzureRMDataFactoryGateway'
            'Get-AzureRMDataFactoryHub'
            'Get-AzureRMDataFactoryLinkedService'
            'Get-AzureRMDataFactoryPipeline'
            'Get-AzureRMDataFactoryRun'
            'Get-AzureRMDataFactorySlice'
            'Get-AzureRMDnsRecordSet'
            'Get-AzureRMDnsZone'
            'Get-AzureRMHDInsightCluster'
            'Get-AzureRMHDInsightJob'
            'Get-AzureRMHDInsightJobOutput'
            'Get-AzureRMKeyVault'
            'Get-AzureRMLoadBalancer'
            'Get-AzureRMLocalNetworkGateway'
            'Get-AzureRMNetworkInterface'
            'Get-AzureRMNetworkSecurityGroup'
            'Get-AzureRMOperationalInsightsStorageInsight'
            'Get-AzureRMOperationalInsightsWorkspace'
            'Get-AzureRMOperationalInsightsWorkspaceManagementGroups'
            'Get-AzureRMOperationalInsightsWorkspaceSharedKeys'
            'Get-AzureRMOperationalInsightsWorkspaceUsage'
            'Get-AzureRMPublicIpAddress'
            'Get-AzureRMRedisCache'
            'Get-AzureRMRedisCacheKey'
            'Get-AzureRMRemoteDesktopFile'
            'Get-AzureRMResource'
            'Get-AzureRMResourceGroup'
            'Get-AzureRMResourceGroupDeployment'
            'Get-AzureRMResourceGroupDeploymentOperation'
            'Get-AzureRMResourceLock'
            'Get-AzureRMRoleAssignment'
            'Get-AzureRMRouteTable'
            'Get-AzureRMSqlDatabase'
            'Get-AzureRMSqlDatabaseActivity'
            'Get-AzureRMSqlDatabaseAuditingPolicy'
            'Get-AzureRMSqlDatabaseDataMaskingPolicy'
            'Get-AzureRMSqlDatabaseDataMaskingRule'
            'Get-AzureRMSqlDatabaseExpanded'
            'Get-AzureRMSqlDatabaseIndexRecommendations'
            'Get-AzureRMSqlDatabaseReplicationLink'
            'Get-AzureRMSqlDatabaseRestorePoints'
            'Get-AzureRMSqlDatabaseSecureConnectionPolicy'
            'Get-AzureRMSqlDatabaseTransparentDataEncryption'
            'Get-AzureRMSqlDatabaseTransparentDataEncryptionActivity'
            'Get-AzureRMSqlDatabaseUpgradeHint'
            'Get-AzureRMSqlElasticPool'
            'Get-AzureRMSqlElasticPoolActivity'
            'Get-AzureRMSqlElasticPoolDatabase'
            'Get-AzureRMSqlElasticPoolRecommendation'
            'Get-AzureRMSqlServer'
            'Get-AzureRMSqlServerActiveDirectoryAdministrator'
            'Get-AzureRMSqlServerAuditingPolicy'
            'Get-AzureRMSqlServerFirewallRule'
            'Get-AzureRMSqlServerServiceObjective'
            'Get-AzureRMSqlServerUpgrade'
            'Get-AzureRMSqlServerUpgradeHint'
            'Get-AzureRMStreamAnalyticsInput'
            'Get-AzureRMStreamAnalyticsJob'
            'Get-AzureRMStreamAnalyticsOutput'
            'Get-AzureRMStreamAnalyticsTransformation'
            'Get-AzureRMTrafficManagerEndpoint'
            'Get-AzureRMTrafficManagerProfile'
            'Get-AzureRMVirtualNetwork'
            'Get-AzureRMVirtualNetworkGateway'
            'Get-AzureRMVirtualNetworkGatewayConnection'
            'Get-AzureRMVirtualNetworkGatewayConnectionSharedKey'
            'Get-AzureRMVM'
            'Get-AzureRMVMAccessExtension'
            'Get-AzureRMVMCustomScriptExtension'
            'Get-AzureRMVMDiagnosticsExtension'
            'Get-AzureRMVMDscExtension'
            'Get-AzureRMVMExtension'
            'Get-AzureRMVMSize'
            'Get-AzureRMVMSqlServerExtension'
            'Get-AzureRMWebApp'
            'Get-AzureRMWebAppPublishingProfile'
            'Grant-AzureRMHDInsightHttpServicesAccess'
            'Grant-AzureRMHDInsightRdpServicesAccess'
            'Import-AzureRMApiManagementHostnameCertificate'
            'Import-AzureRMAutomationDscConfiguration'
            'Import-AzureRMAutomationRunbook'
            'Invoke-AzureRMResourceAction'
            'New-AzureRMApiManagement'
            'New-AzureRMApiManagementContext'
            'New-AzureRMApplicationGateway'
            'New-AzureRMAppServicePlan'
            'New-AzureRMAutomationAccount'
            'New-AzureRMAutomationCertificate'
            'New-AzureRMAutomationConnection'
            'New-AzureRMAutomationCredential'
            'New-AzureRMAutomationKey'
            'New-AzureRMAutomationModule'
            'New-AzureRMAutomationRunbook'
            'New-AzureRMAutomationSchedule'
            'New-AzureRMAutomationVariable'
            'New-AzureRMAutomationWebhook'
            'New-AzureRMAvailabilitySet'
            'New-AzureRMBackupVault'
            'New-AzureRMBatchAccount'
            'New-AzureRMBatchAccountKey'
            'New-AzureRMDataFactory'
            'New-AzureRMDataFactoryDataset'
            'New-AzureRMDataFactoryEncryptValue'
            'New-AzureRMDataFactoryGateway'
            'New-AzureRMDataFactoryGatewayKey'
            'New-AzureRMDataFactoryHub'
            'New-AzureRMDataFactoryLinkedService'
            'New-AzureRMDataFactoryPipeline'
            'New-AzureRMDnsRecordSet'
            'New-AzureRMDnsZone'
            'New-AzureRMHDInsightCluster'
            'New-AzureRMKeyVault'
            'New-AzureRMLoadBalancer'
            'New-AzureRMLocalNetworkGateway'
            'New-AzureRMNetworkInterface'
            'New-AzureRMNetworkSecurityGroup'
            'New-AzureRMOperationalInsightsStorageInsight'
            'New-AzureRMOperationalInsightsWorkspace'
            'New-AzureRMPublicIpAddress'
            'New-AzureRMRedisCache'
            'New-AzureRMRedisCacheKey'
            'New-AzureRMResource'
            'New-AzureRMResourceGroup'
            'New-AzureRMResourceGroupDeployment'
            'New-AzureRMResourceLock'
            'New-AzureRMRoleAssignment'
            'New-AzureRMRouteTable'
            'New-AzureRMSqlDatabase'
            'New-AzureRMSqlDatabaseCopy'
            'New-AzureRMSqlDatabaseDataMaskingRule'
            'New-AzureRMSqlDatabaseSecondary'
            'New-AzureRMSqlElasticPool'
            'New-AzureRMSqlServer'
            'New-AzureRMSqlServerFirewallRule'
            'New-AzureRMStreamAnalyticsInput'
            'New-AzureRMStreamAnalyticsJob'
            'New-AzureRMStreamAnalyticsOutput'
            'New-AzureRMStreamAnalyticsTransformation'
            'New-AzureRMTrafficManagerEndpoint'
            'New-AzureRMTrafficManagerProfile'
            'New-AzureRMVirtualNetwork'
            'New-AzureRMVirtualNetworkGateway'
            'New-AzureRMVirtualNetworkGatewayConnection'
            'New-AzureRMVM'
            'New-AzureRMWebApp'
            'New-AzureVMSqlServerAutoBackupConfig'
            'Publish-AzureRMAutomationRunbook'
            'Publish-AzureRMVMDscConfiguration'
            'Register-AzureRMAutomationDscNode'
            'Register-AzureRMAutomationScheduledRunbook'
            'Register-AzureRMBackupContainer'
            'Remove-AzureRMApiManagement'
            'Remove-AzureRMApplicationGateway'
            'Remove-AzureRMAppServicePlan'
            'Remove-AzureRMAutomationAccount'
            'Remove-AzureRMAutomationCertificate'
            'Remove-AzureRMAutomationConnection'
            'Remove-AzureRMAutomationCredential'
            'Remove-AzureRMAutomationModule'
            'Remove-AzureRMAutomationRunbook'
            'Remove-AzureRMAutomationSchedule'
            'Remove-AzureRMAutomationVariable'
            'Remove-AzureRMAutomationWebhook'
            'Remove-AzureRMAvailabilitySet'
            'Remove-AzureRMBatchAccount'
            'Remove-AzureRMDataFactory'
            'Remove-AzureRMDataFactoryDataset'
            'Remove-AzureRMDataFactoryGateway'
            'Remove-AzureRMDataFactoryHub'
            'Remove-AzureRMDataFactoryLinkedService'
            'Remove-AzureRMDataFactoryPipeline'
            'Remove-AzureRMDnsRecordSet'
            'Remove-AzureRMDnsZone'
            'Remove-AzureRMHDInsightCluster'
            'Remove-AzureRMKeyVault'
            'Remove-AzureRMKeyVaultAccessPolicy'
            'Remove-AzureRMLoadBalancer'
            'Remove-AzureRMLocalNetworkGateway'
            'Remove-AzureRMNetworkInterface'
            'Remove-AzureRMNetworkSecurityGroup'
            'Remove-AzureRMOperationalInsightsStorageInsight'
            'Remove-AzureRMOperationalInsightsWorkspace'
            'Remove-AzureRMPublicIpAddress'
            'Remove-AzureRMRedisCache'
            'Remove-AzureRMResource'
            'Remove-AzureRMResourceGroup'
            'Remove-AzureRMResourceGroupDeployment'
            'Remove-AzureRMResourceLock'
            'Remove-AzureRMRoleAssignment'
            'Remove-AzureRMRouteTable'
            'Remove-AzureRMSqlDatabase'
            'Remove-AzureRMSqlDatabaseAuditing'
            'Remove-AzureRMSqlDatabaseDataMaskingRule'
            'Remove-AzureRMSqlDatabaseSecondary'
            'Remove-AzureRMSqlElasticPool'
            'Remove-AzureRMSqlServer'
            'Remove-AzureRMSqlServerActiveDirectoryAdministrator'
            'Remove-AzureRMSqlServerAuditing'
            'Remove-AzureRMSqlServerFirewallRule'
            'Remove-AzureRMStorageAccount'
            'Remove-AzureRMStreamAnalyticsInput'
            'Remove-AzureRMStreamAnalyticsJob'
            'Remove-AzureRMStreamAnalyticsOutput'
            'Remove-AzureRMTrafficManagerEndpoint'
            'Remove-AzureRMTrafficManagerProfile'
            'Remove-AzureRMVirtualNetwork'
            'Remove-AzureRMVirtualNetworkGateway'
            'Remove-AzureRMVirtualNetworkGatewayConnection'
            'Remove-AzureRMVM'
            'Remove-AzureRMVMAccessExtension'
            'Remove-AzureRMVMCustomScriptExtension'
            'Remove-AzureRMVMDiagnosticsExtension'
            'Remove-AzureRMVMDscExtension'
            'Remove-AzureRMVMExtension'
            'Remove-AzureRMVMSqlServerExtension'
            'Remove-AzureRMWebApp'
            'Reset-AzureRMVirtualNetworkGatewayConnectionSharedKey'
            'Restart-AzureRMVM'
            'Restart-AzureRMWebApp'
            'Restore-AzureRMApiManagement'
            'Resume-AzureRMAutomationJob'
            'Resume-AzureRMDataFactoryPipeline'
            'Resume-AzureRMSqlDatabase'
            'Revoke-AzureRMHDInsightHttpServicesAccess'
            'Revoke-AzureRMHDInsightRdpServicesAccess'
            'Save-AzureRMDataFactoryLog'
            'Save-AzureRMVMImage'
            'Set-AzureRMApiManagementHostnames'
            'Set-AzureRMApiManagementVirtualNetworks'
            'Set-AzureRMAppServicePlan'
            'Set-AzureRMAutomationAccount'
            'Set-AzureRMAutomationCertificate'
            'Set-AzureRMAutomationConnectionFieldValue'
            'Set-AzureRMAutomationCredential'
            'Set-AzureRMAutomationDscNode'
            'Set-AzureRMAutomationModule'
            'Set-AzureRMAutomationRunbook'
            'Set-AzureRMAutomationSchedule'
            'Set-AzureRMAutomationVariable'
            'Set-AzureRMAutomationWebhook'
            'Set-AzureRMBatchAccount'
            'Set-AzureRMDataFactoryGateway'
            'Set-AzureRMDataFactoryPipelineActivePeriod'
            'Set-AzureRMDataFactorySliceStatus'
            'Set-AzureRMDnsZone'
            'Set-AzureRMHDInsightClusterSize'
            'Set-AzureRMKeyVaultAccessPolicy'
            'Set-AzureRMOperationalInsightsStorageInsight'
            'Set-AzureRMOperationalInsightsWorkspace'
            'Set-AzureRMRedisCache'
            'Set-AzureRMResource'
            'Set-AzureRMResourceGroup'
            'Set-AzureRMResourceLock'
            'Set-AzureRMSqlDatabase'
            'Set-AzureRMSqlDatabaseAuditingPolicy'
            'Set-AzureRMSqlDatabaseDataMaskingPolicy'
            'Set-AzureRMSqlDatabaseDataMaskingRule'
            'Set-AzureRMSqlDatabaseSecondary'
            'Set-AzureRMSqlDatabaseTransparentDataEncryption'
            'Set-AzureRMSqlElasticPool'
            'Set-AzureRMSqlServer'
            'Set-AzureRMSqlServerActiveDirectoryAdministrator'
            'Set-AzureRMSqlServerAuditingPolicy'
            'Set-AzureRMSqlServerFirewallRule'
            'Set-AzureRMStorageAccount'
            'Set-AzureRMVirtualNetworkGatewayConnectionSharedKey'
            'Set-AzureRMVM'
            'Set-AzureRMVMAccessExtension'
            'Set-AzureRMVMCustomScriptExtension'
            'Set-AzureRMVMDiagnosticsExtension'
            'Set-AzureRMVMDscExtension'
            'Set-AzureRMVMExtension'
            'Set-AzureRMVMSqlServerExtension'
            'Start-AzureRMAutomationDscCompilationJob'
            'Start-AzureRMAutomationRunbook'
            'Start-AzureRMHDInsightJob'
            'Start-AzureRMSqlDatabaseExecuteIndexRecommendation'
            'Start-AzureRMSqlServerUpgrade'
            'Start-AzureRMStreamAnalyticsJob'
            'Start-AzureRMVM'
            'Start-AzureRMWebApp'
            'Stop-AzureRMAutomationJob'
            'Stop-AzureRMHDInsightJob'
            'Stop-AzureRMResourceGroupDeployment'
            'Stop-AzureRMSqlDatabaseExecuteIndexRecommendation'
            'Stop-AzureRMSqlServerUpgrade'
            'Stop-AzureRMStreamAnalyticsJob'
            'Stop-AzureRMVM'
            'Stop-AzureRMWebApp'
            'Suspend-AzureRMAutomationJob'
            'Suspend-AzureRMDataFactoryPipeline'
            'Suspend-AzureRMSqlDatabase'
            'Test-AzureRMResource'
            'Test-AzureRMResourceGroup'
            'Test-AzureRMResourceGroupTemplate'
            'Test-AzureRMStreamAnalyticsInput'
            'Test-AzureRMStreamAnalyticsOutput'
            'Unregister-AzureRMAutomationDscNode'
            'Unregister-AzureRMAutomationScheduledRunbook'
            'Update-AzureRMApiManagementDeployment'
            'Update-AzureRMVM'
            'Use-AzureRMHDInsightCluster'
            'Use-AzureRMSqlServerAuditingPolicy'
            'Wait-AzureRMHDInsightJob'
        );
        ParameterName = 'ResourceGroupName';
        #Description = 'Complete the -ResourceGroupName parameter value for Azure Resource Manager cmdlets: New-AzureVM -ResourceGroupName <TAB>';
        ScriptBlock = $ScriptBlock;
}

Microsoft.PowerShell.Core\Register-ArgumentCompleter @ArgumentCompleter;

$ArgumentCompleter = @{
        CommandName = @(
            'Find-AzureRmResourceGroup'
            'Get-AzureRmResourceGroup'
            'New-AzureRmResourceGroup'
            'Remove-AzureRmResourceGroup'
            'Set-AzureRmResourceGroup'
        );
        ParameterName = 'Name';
        #Description = 'Complete the -Name parameter value for the core Azure Resource Manager (ARM) Resource Group cmdlets: Get-AzureRmResourceGroup -Name <TAB>';
        ScriptBlock = $ScriptBlock;
}

Microsoft.PowerShell.Core\Register-ArgumentCompleter @ArgumentCompleter;