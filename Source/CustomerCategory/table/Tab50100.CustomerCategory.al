table 50100 "Customer Category"
{
    DrillDownPageId = "Customer Category List";
    LookupPageId = "Customer Category List";
    Caption='Customer Category';
    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';           
            trigger OnValidate();
            begin
            end;
        }

        field(2; Description; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }

        field(3; Default; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Default';
        }

        field(4; TotalCustomersForCategory; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count (Customer where ("Customer Category" = 
             field (No)));
            Caption = 'Total customers for category';
        }

        field(5; EnableNewsletter; Option)
        {
            OptionMembers = " ","Full","Limited";
            OptionCaption = ' ,Full,Limited';
            Caption = 'Enable Newsletter';
            DataClassification = CustomerContent;
        }

        field(6; FreeGiftsAvailable; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Free Gifts Available';
        }
    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
   }