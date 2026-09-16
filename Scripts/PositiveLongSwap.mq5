//+------------------------------------------------------------------+
//|                                             PositiveLongSwap.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---

int Auscounter = 0;

for(int i=0; i<SymbolsTotal(false); i++)
{

   //Print(SymbolName(i,false) + "The country is " + SymbolInfoString(SymbolName(i,false),SYMBOL_COUNTRY));
   
   if(SymbolInfoDouble(SymbolName(i,false),SYMBOL_SWAP_LONG)>0)
   {
      Print(SymbolName(i,false) + " " + SymbolInfoDouble(SymbolName(i,false),SYMBOL_SWAP_LONG) + "\n");
   }
   
   /*if(SymbolInfoString(SymbolName(i,false),SYMBOL_COUNTRY)=="AUS")
   {
      Print(SymbolName(i,false) + " " + SymbolInfoString(SymbolName(i,false),SYMBOL_COUNTRY) + "\n");
      Auscounter++;
   }*/
   
   
}

Print("the total number of Aussie symbols is " + (string) Auscounter);

//Print ("The total number of symbols is " + (string) SymbolsTotal(false));
   
  }
//+------------------------------------------------------------------+
