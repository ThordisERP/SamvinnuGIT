codeunit 50105 CustomerCategoryInstall
{
    Subtype = Install;
    trigger OnInstallAppPerCompany();
    var
        archivedVersion: Text;
        CustomerCategory: Record "Customer Category";
    begin
        archivedVersion := NavApp.GetArchiveVersion;
        if archivedVersion = '1.0.0.0' then begin
            NavApp.RestoreArchiveData(Database::"Customer Category");
            NavApp.RestoreArchiveData(Database::Customer);
            NavApp.DeleteArchiveData(Database::"Customer Category");
            NavApp.DeleteArchiveData(Database::Customer);
        end;
        if CustomerCategory.IsEmpty() then
            InsertDefaultCustomerCategory();

        //Here we could fill the Customer Category field for every Customer in the database with the default value
        //SetDefaultCustomerCategoryForEveryCustomer();
    end;

    // Insert the GOLD, SILVER, BRONZE reward levels
    procedure InsertDefaultCustomerCategory();
    begin
        InsertCustomerCategory('TOP', 'Top Customer');
        InsertCustomerCategory('MEDIUM', 'Standard Customer');
        InsertCustomerCategory('BAD', 'Bad Customer');
    end;

    // Create and insert a Customer Category record
    procedure InsertCustomerCategory(ID: Code[30]; Description:
    Text[250]);
    var
        CustomerCategory: Record "Customer Category";
    begin
        CustomerCategory.Init();
        CustomerCategory.No := ID;
        CustomerCategory.Description := Description;
        CustomerCategory.Insert();
    end;
}