codeunit 50001 "Raise Telemetry Events"
{
    procedure RaiseEvent(Level: Verbosity)
    var
        CriticalEventMsg: Label 'A critical event';
        ErrorEventMsg: Label 'A error event';
        WarningEventMsg: Label 'A warning event';
        NormalEventMsg: Label 'A normal event';
        CategoryTxt: Label 'Page Action';
        EventRaiseMsg: Label 'Event raised';
        CustDimension: Dictionary of [Text, Text];
    begin
        case Level of
            level::Normal:
                begin
                    CustDimension.Add('result', 'failed');
                    CustDimension.Add('reason', 'critical error in code');
                    LogMessage('MyExt-0001', 'This is a critical error message', Verbosity::Normal, DATACLASSIFICATION::SystemMetadata, TelemetryScope::ExtensionPublisher, CustDimension);
                end;
            level::Critical:
                LogMessage('MyExt-0001', 'This is a critical error message', Verbosity::Critical, DATACLASSIFICATION::SystemMetadata, TelemetryScope::ExtensionPublisher, 'result', 'failed', 'reason', 'critical error in code');
            level::Warning:
                LogMessage('MyExt-0001', 'This is a critical error message', Verbosity::Normal, DATACLASSIFICATION::SystemMetadata, TelemetryScope::ExtensionPublisher, CustDimension);
            level::Error:
                LogMessage('MyExt-0001', 'This is a error message', Verbosity::Error, DATACLASSIFICATION::SystemMetadata, TelemetryScope::ExtensionPublisher, CustDimension);
        end;

        Message(EventRaiseMsg);
    end;
}