report 50200 "PurisProductionLabels"
{
    ApplicationArea = All;
    Caption = 'Puris Production Labels';
    DefaultRenderingLayout = PurisProductionLabelsLayout;

    dataset
    {
        dataitem("Production Order"; "Production Order")
        {

            column(No_; "No.") { }

            dataitem("Prod. Order Line"; "Prod. Order Line")
            {
                DataItemLink = "Prod. Order No." = field("No.");


                column(Item_No_; "Item No.") { }
                column(Description; Description) { }
                column(Description_2; "Description 2") { }
                column(Location_Code; "Location Code") { }
                column(Inventory_Posting_Group; "Inventory Posting Group") { }
                column(Variant_Code; "Variant Code") { }

                column(barcodeData; barcodeData.Image) { }

                trigger OnAfterGetRecord()
                var
                    barcodeGenerator: Codeunit "IWX Library - Barcode Gen";
                    barCodeDotSize: Integer;
                    encodedText: Text;

                begin
                    encodedText := format('%P') + format("Production Order"."No.") + format(' ') + format("Prod. Order Line"."Line No.");
                    barCodeDotSize := 144;
                    barcodeGenerator.GenerateMatrixBarcode(barcodeData, encodedText, barCodeDotSize, 16);
                end;
            }
        }
    }

    rendering
    {
        layout(PurisProductionLabelsLayout)
        {
            Type = RDLC;
            LayoutFile = 'rdlc/PurisProductionLabels.rdlc';
        }
    }

    var
        barcodeData: Record "IWX Barcode" temporary;



}