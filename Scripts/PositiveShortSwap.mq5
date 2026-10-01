//+------------------------------------------------------------------+
//|                                            PositiveShortSwap.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   
   for(int i=0; i<SymbolsTotal(false); i++)
{
   
   if(SymbolInfoDouble(SymbolName(i,false),SYMBOL_SWAP_SHORT)>0)
   {
      Print(SymbolName(i,false) + " " + (string) SymbolInfoDouble(SymbolName(i,false),SYMBOL_SWAP_SHORT) + "\n");
   }
   
}
   
  }
//+------------------------------------------------------------------+
