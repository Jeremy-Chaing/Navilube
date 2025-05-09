table 99120 Sponsor
{
    Caption = 'Sponsor';
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Sponsor Number"; Code[20])
        {
            Caption = 'Sponsor Number';
        }
        field(20; "Sponsor's Name"; Text[100])
        {
            Caption = 'Sponsor''s Name';
        }
        field(30; "Sponsor's Address"; Text[250])
        {
            Caption = 'Sponsor''s Address';
        }
        field(40; "Active Status"; Boolean)
        {
            Caption = 'Active Status';
        }
        field(50; "Join Date"; Date)
        {
            Caption = 'Join Date';
        }
        field(60; "Sponsorship Level"; Enum "Sponsorship Level")
        {
            Caption = 'Sponsorship Level';
        }
        field(70; "Sponsor Team"; Text[100])
        {
            Caption = 'Sponsor Team';
        }
        field(80; "Marital Status"; enum "Marital Status")
        {
            Caption = 'Marital Status';
        }
        field(90; "Number of Children"; Integer)
        {
            Caption = 'Number of Children';
        }
        field(100; "Total Pledge Amount"; Decimal)
        {
            Caption = 'Total Pledge Amount';
            FieldClass = FlowField;
            CalcFormula = sum(Pledge."Pledge Amount" where("Sponsor No." = field("Sponsor Number")));
        }
        field(110; "Total Contribution Amount"; Decimal)
        {
            Caption = 'Total Contribution Amount';
            FieldClass = FlowField;
            CalcFormula = sum(Contribution."Contribution Amount" where("Sponsor No." = field("Sponsor Number")));
        }
    }
    keys
    {
        key(PK; "Sponsor Number")
        {
            Clustered = true;
        }
    }
}

enum 99121 "Sponsorship Level"
{
    Extensible = true;
    value(0; Rookie) { Caption = 'Rookie'; }
    value(1; "Major League") { Caption = 'Major League'; }
    value(2; "All-Star") { Caption = 'All-Star'; }
    value(3; "Hall-of-Fame") { Caption = 'Hall-of-Fame'; }
}

enum 99122 "Marital Status"
{
    Extensible = true;
    value(0; Single) { Caption = 'Single'; }
    value(1; Married) { Caption = 'Married'; }
    value(2; Divorced) { Caption = 'Divorced'; }
    value(3; Widowed) { Caption = 'Widowed'; }
    value(4; Other) { Caption = 'Other'; }
}