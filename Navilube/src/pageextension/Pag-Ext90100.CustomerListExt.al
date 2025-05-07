// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.ALProject2;

using Microsoft.Sales.Customer;
using NaviLube.NaviLube;

pageextension 90100 CustomerListExt extends "Customer List"
{
    actions
    {
        addlast(Processing)
        {
            action(ViewVehiclesForCustomer)
            {
                Caption = '查看該客戶車輛';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    VehiclePage: Page "Vehicle List";
                    VehicleRec: Record Vehicle;
                begin
                    VehicleRec.SetRange("Customer No.", Rec."No.");
                    VehiclePage.SetTableView(VehicleRec);
                    VehiclePage.Run();
                end;
            }
        }
    }
}