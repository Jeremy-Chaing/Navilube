table 99123 Contribution
{
    Caption = 'Contribution';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(10; "Line No."; Code[20])
        {
            Caption = 'Line No.';
        }
        field(20; "Sponsor No."; Code[20])
        {
            Caption = 'Sponsor No.';
        }
        field(30; Description; Text)
        {
            Caption = 'Description';
        }
        field(40; "Contribution Date"; Date)
        {
            Caption = 'Contribution Date';
        }
        field(50; "Contribution Amount"; Decimal)
        {
            Caption = 'Contribution Amount';
        }
    }
    keys
    {
        key(PK; "Line No.")
        {
            Clustered = true;
        }
    }
}
