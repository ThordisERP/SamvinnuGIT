codeunit 50106 CustomerCategoryUpgrade
{
    Subtype = Upgrade;
    trigger OnUpgradePerCompany();
    var
        CustomerCategory: Record "Customer Category";
        Module: ModuleInfo;
    begin
        // Get information about the current module.
        NavApp.GetCurrentModuleInfo(Module);
        // In the new version, the BAD class is upgraded to WARNING
        if Module.DataVersion.Major = 1 then begin
            IF CustomerCategory.Get('BAD') THEN BEGIN
                CustomerCategory.Rename('WARNING');
                CustomerCategory.Description := 'Warning Customer [UPG]';
                CustomerCategory.Modify();
            END;
        end;
    end;
}