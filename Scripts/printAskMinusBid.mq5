//+------------------------------------------------------------------+
//|                                             printAskMinusBid.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

double Ask,Bid,askMinusBid;


//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---

//---Obtaining Ask price and Bid Price
   Ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
   Bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);
   
   Print("The ask price is " + (string) Ask);
   Print("The bid price is " + (string) Bid);
   
   if(StringFind(_Symbol,"JPY.a", 0)!=-1)
   {
      Print("Ask - Bid is " + (string) NormalizeDouble(Ask-Bid,3));
      //Print("in jpy");
   }
   else
   {
      Print("Ask - Bid is " + (string) NormalizeDouble(Ask-Bid,5));
      //Print("NOT in jpy");
   }
   
   //Print("The spread in pips is " + (string) spreadInPips);

  }
//+------------------------------------------------------------------+
