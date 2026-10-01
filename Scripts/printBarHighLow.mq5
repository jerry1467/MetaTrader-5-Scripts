//+------------------------------------------------------------------+
//|                                              printBarHighLow.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property script_show_inputs

input int whichPreviousBar = 1;

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---

   MqlRates rates[];
   ArraySetAsSeries(rates,true);

//---Checking and Copying Prices into the Rates Object
   if(CopyRates(_Symbol,_Period,0,whichPreviousBar+1,rates)==-1)
     {
      Print("Error Copying Price Data",GetLastError());
      return;
     }

      Print("The high of previous bar " + (string) whichPreviousBar + " is " + (string) rates[whichPreviousBar].high +".");
      Print("The low of previous bar " + (string) whichPreviousBar + " is " + (string) rates[whichPreviousBar].low + ".");



     }
//+------------------------------------------------------------------+
