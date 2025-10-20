pageextension 50200 PurisProductionLabels extends "Released Production Order"
{

    actions
    {
        addlast("&Print")
        {
            action("Puris Production Labels")
            {
                ApplicationArea = All;
                Caption = 'Puris Production Labels';
                Image = Production;
                Visible = ShowProteinsFields;
                trigger OnAction()
                var
                    ProdLinesData: Record "Prod. Order Line";

                begin
                    // ProdLinesData.SetRange("Prod. Order No.", Rec."No.");
                    // if ProdLinesData.FindSet() then begin
                    Rec.SetRange("No.", Rec."No.");
                    if Rec.FindSet() then begin
                        Report.RunModal(Report::PurisProductionLabels, false, false, Rec);
                    end;
                end;
            }
        }
    }

    var
        ShowProteinsFields: Boolean;
        CompanyScopeCheck: Codeunit CompanyScopeCheck;

    trigger OnOpenPage()
    begin
        ShowProteinsFields := CompanyScopeCheck.isProteins();
        CurrPage.Update(false);
    end;
}