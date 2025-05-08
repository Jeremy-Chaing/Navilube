table 99122 Pledge
{
    Caption = 'Pledge';
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
        field(30; "Pledge Date"; Date)
        {
            Caption = 'Pledge Date';
        }
        field(40; "Pledge Amount"; dec)
        {
            Caption = 'Pledge Amount';
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
