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

    procedure GenerateBarCode()
    var
        BarCodeRecord: Record "IWX Barcode";
        Generator: Codeunit "IWX Library - Barcode Gen";
        prodLineData: Record "Prod. Order Line";
        tempBlob: Codeunit "Temp Blob";
        textCodeData: Text;
    begin
        // prodLineData.Reset();
        // prodLineData.SetRange("Prod. Order No.", Rec."No.");

        // repeat
        //     textCodeData := format('%P') + format(Rec."No.") + format(' ') + format(prodLineData."Line No.");
        //     Generator.GenerateMatrixBarcode(tempBlob, textCodeData, 144, 16);
        // until prodLineData.Next() = 0;
    end;
}