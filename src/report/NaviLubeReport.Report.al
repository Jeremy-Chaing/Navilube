namespace Navilube.Navilube;

report 90100 "NaviLube Report"
{
    ApplicationArea = All;
    Caption = 'NaviLube Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RDLCLayout;

    dataset
    {
        dataitem(Vehicle234; Vehicle)
        {
            RequestFilterFields = VIN, "Customer No.";
            column(VIN; VIN)
            {
            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(Description; Description)
            {
            }
            column(Transmission; Transmission)
            {
            }
            column(TotalServiceDollars; "Total Service Dollars")
            {
            }
            column(TotalServiceVisits; "Total Service Visits")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    rendering
    {
        layout(RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = 'src/report/layout/navilubreport.rdl';
        }
        layout(RDLCLayout1)
        {
            Type = RDLC;
            LayoutFile = 'src/report/layout/navilubreport1.rdl';
        }
    }
}
