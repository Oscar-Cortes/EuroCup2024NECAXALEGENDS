*****************************************;
** SAS Scoring Code for PROC Genmod;
*****************************************;

label P_GOALS = 'Predicted: GOALS' ;
drop _LMR_BAD;
_LMR_BAD=0;

*** Check interval variables for missing values;
if nmiss(AGE,MINUTES,OPPONENT_RANKING,ROUND_N,SQUAD_RANKING) then do;
   _LMR_BAD=1;
   goto _SKIP_000;
end;

*** Generate design variables for Country;
length _st20 $ 20; drop _st20;
_st20 = left(trim(put (Country, $20.)));
_0_0= 0; 
_0_1= 0; 
_0_2= 0; 
_0_3= 0; 
_0_4= 0; 
_0_5= 0; 
_0_6= 0; 
_0_7= 0; 
_0_8= 0; 
_0_9= 0; 
_0_10= 0; 
_0_11= 0; 
_0_12= 0; 
_0_13= 0; 
_dm_find = 0; drop _dm_find;
if _st20 <= 'hr'  then do;
   if _st20 <= 'dk'  then do;
      if _st20 <= 'cz'  then do;
         if _st20 = 'be'  then do;
            _0_0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _st20 = 'cz'  then do;
               _0_1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _st20 = 'de'  then do;
            _0_2 = 1;
            _dm_find = 1;
         end;
         else do;
            if _st20 = 'dk'  then do;
               _0_3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _st20 <= 'es'  then do;
         if _st20 = 'eng'  then do;
            _0_4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _st20 = 'es'  then do;
               _0_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _st20 = 'fr'  then do;
            _0_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _st20 = 'hr'  then do;
               _0_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
end;
else do;
   if _st20 <= 'pl'  then do;
      if _st20 <= 'it'  then do;
         if _st20 = 'hu'  then do;
            _0_8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _st20 = 'it'  then do;
               _0_9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _st20 = 'nl'  then do;
            _0_10 = 1;
            _dm_find = 1;
         end;
         else do;
            if _st20 = 'pl'  then do;
               _0_11 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _st20 <= 'sc'  then do;
         if _st20 = 'pt'  then do;
            _0_12 = 1;
            _dm_find = 1;
         end;
         else do;
            if _st20 = 'sc'  then do;
               _0_13 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _st20 = 'ua'  then do;
            _dm_find = 1;
         end;
      end;
   end;
end;
if not _dm_find then do;
   _0_0 = .;
   _0_1 = .;
   _0_2 = .;
   _0_3 = .;
   _0_4 = .;
   _0_5 = .;
   _0_6 = .;
   _0_7 = .;
   _0_8 = .;
   _0_9 = .;
   _0_10 = .;
   _0_11 = .;
   _0_12 = .;
   _0_13 = .;
   _LMR_BAD=1;
   goto _SKIP_000;
end;

*** Generate design variables for FOOT;
length _st12 $ 12; drop _st12;
_st12 = left(trim(put (FOOT, BEST12.)));
_1_0= 0; 
if _st12 = '1'  then do;
   _1_0 = 1;
end;
else if _st12 = '2'  then do;
end;
else do;
   _1_0 = .;
   _LMR_BAD=1;
   goto _SKIP_000;
end;

*** Generate design variables for OPPONENT;
length _st20 $ 20; drop _st20;
_st20 = left(trim(put (OPPONENT, $20.)));
_2_0= 0; 
_2_1= 0; 
_2_2= 0; 
_2_3= 0; 
_2_4= 0; 
_2_5= 0; 
_2_6= 0; 
_2_7= 0; 
_2_8= 0; 
_2_9= 0; 
_2_10= 0; 
_2_11= 0; 
_2_12= 0; 
_2_13= 0; 
_2_14= 0; 
_2_15= 0; 
_2_16= 0; 
_2_17= 0; 
_2_18= 0; 
_2_19= 0; 
_2_20= 0; 
_2_21= 0; 
_2_22= 0; 
_2_23= 0; 
_2_24= 0; 
_2_25= 0; 
_2_26= 0; 
_2_27= 0; 
_2_28= 0; 
_2_29= 0; 
_2_30= 0; 
_2_31= 0; 
_2_32= 0; 
_2_33= 0; 
_2_34= 0; 
_2_35= 0; 
_2_36= 0; 
_2_37= 0; 
_2_38= 0; 
_2_39= 0; 
_2_40= 0; 
_2_41= 0; 
_2_42= 0; 
_2_43= 0; 
_2_44= 0; 
_2_45= 0; 
_2_46= 0; 
_2_47= 0; 
_2_48= 0; 
_2_49= 0; 
_2_50= 0; 
_2_51= 0; 
_2_52= 0; 
_2_53= 0; 
_2_54= 0; 
_2_55= 0; 
_2_56= 0; 
_2_57= 0; 
_2_58= 0; 
_2_59= 0; 
_2_60= 0; 
_2_61= 0; 
_2_62= 0; 
_2_63= 0; 
_2_64= 0; 
_2_65= 0; 
_2_66= 0; 
_2_67= 0; 
_2_68= 0; 
_2_69= 0; 
_2_70= 0; 
_2_71= 0; 
_2_72= 0; 
_2_73= 0; 
_2_74= 0; 
_2_75= 0; 
_2_76= 0; 
_2_77= 0; 
_2_78= 0; 
_2_79= 0; 
_2_80= 0; 
_2_81= 0; 
_2_82= 0; 
_2_83= 0; 
_2_84= 0; 
_2_85= 0; 
_2_86= 0; 
_2_87= 0; 
_2_88= 0; 
_2_89= 0; 
_dm_find = 0; drop _dm_find;
if _st20 <= 'Korea DPR'  then do;
   if _st20 <= 'Cyprus'  then do;
      if _st20 <= 'Belgium'  then do;
         if _st20 <= 'Armenia'  then do;
            if _st20 <= 'Andorra'  then do;
               if _st20 <= 'Algeria'  then do;
                  if _st20 = 'Albania'  then do;
                     _2_0 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Algeria'  then do;
                        _2_1 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Andorra'  then do;
                     _2_2 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _st20 <= 'Argentina'  then do;
                  if _st20 = 'Angola'  then do;
                     _2_3 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Argentina'  then do;
                        _2_4 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Armenia'  then do;
                     _2_5 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
         end;
         else do;
            if _st20 <= 'Azerbaijan'  then do;
               if _st20 <= 'Austria'  then do;
                  if _st20 = 'Australia'  then do;
                     _2_6 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Austria'  then do;
                        _2_7 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Azerbaijan'  then do;
                     _2_8 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _st20 <= 'Belarus'  then do;
                  if _st20 = 'Bahrain'  then do;
                     _2_9 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Belarus'  then do;
                        _2_10 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Belgium'  then do;
                     _2_11 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
         end;
      end;
      else do;
         if _st20 <= 'Chile'  then do;
            if _st20 <= 'Brazil'  then do;
               if _st20 <= 'Bosnia  Herzna'  then do;
                  if _st20 = 'Bolivia'  then do;
                     _2_12 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Bosnia  Herzna'  then do;
                        _2_13 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Brazil'  then do;
                     _2_14 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _st20 <= 'Cameroon'  then do;
                  if _st20 = 'Bulgaria'  then do;
                     _2_15 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Cameroon'  then do;
                        _2_16 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Chile'  then do;
                     _2_17 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
         end;
         else do;
            if _st20 <= 'Croatia'  then do;
               if _st20 <= 'Costa Rica'  then do;
                  if _st20 = 'Colombia'  then do;
                     _2_18 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Costa Rica'  then do;
                        _2_19 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Croatia'  then do;
                     _2_20 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _st20 = 'Cte dIvoire'  then do;
                  _2_21 = 1;
                  _dm_find = 1;
               end;
               else do;
                  if _st20 = 'Cyprus'  then do;
                     _2_22 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
         end;
      end;
   end;
   else do;
      if _st20 <= 'Ghana'  then do;
         if _st20 <= 'Estonia'  then do;
            if _st20 <= 'Ecuador'  then do;
               if _st20 <= 'Denmark'  then do;
                  if _st20 = 'Czechia'  then do;
                     _2_23 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Denmark'  then do;
                        _2_24 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Ecuador'  then do;
                     _2_25 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _st20 <= 'England'  then do;
                  if _st20 = 'Egypt'  then do;
                     _2_26 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'England'  then do;
                        _2_27 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Estonia'  then do;
                     _2_28 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
         end;
         else do;
            if _st20 <= 'France'  then do;
               if _st20 <= 'Finland'  then do;
                  if _st20 = 'Faroe Islands'  then do;
                     _2_29 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Finland'  then do;
                        _2_30 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'France'  then do;
                     _2_31 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _st20 <= 'Germany'  then do;
                  if _st20 = 'Georgia'  then do;
                     _2_32 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Germany'  then do;
                        _2_33 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Ghana'  then do;
                     _2_34 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
         end;
      end;
      else do;
         if _st20 <= 'Israel'  then do;
            if _st20 <= 'Hungary'  then do;
               if _st20 <= 'Greece'  then do;
                  if _st20 = 'Gibraltar'  then do;
                     _2_35 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Greece'  then do;
                        _2_36 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Hungary'  then do;
                     _2_37 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _st20 <= 'Iceland'  then do;
                  if _st20 = 'IR Iran'  then do;
                     _2_38 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Iceland'  then do;
                        _2_39 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Israel'  then do;
                     _2_40 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
         end;
         else do;
            if _st20 <= 'Jordan'  then do;
               if _st20 <= 'Japan'  then do;
                  if _st20 = 'Italy'  then do;
                     _2_41 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Japan'  then do;
                        _2_42 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Jordan'  then do;
                     _2_43 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _st20 = 'Kazakhstan'  then do;
                  _2_44 = 1;
                  _dm_find = 1;
               end;
               else do;
                  if _st20 = 'Korea DPR'  then do;
                     _2_45 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
         end;
      end;
   end;
end;
else do;
   if _st20 <= 'Portugal'  then do;
      if _st20 <= 'Morocco'  then do;
         if _st20 <= 'Luxembourg'  then do;
            if _st20 <= 'Latvia'  then do;
               if _st20 <= 'Kosovo'  then do;
                  if _st20 = 'Korea Republic'  then do;
                     _2_46 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Kosovo'  then do;
                        _2_47 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Latvia'  then do;
                     _2_48 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _st20 <= 'Lithuania'  then do;
                  if _st20 = 'Liechtenstein'  then do;
                     _2_49 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Lithuania'  then do;
                        _2_50 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Luxembourg'  then do;
                     _2_51 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
         end;
         else do;
            if _st20 <= 'Mexico'  then do;
               if _st20 <= 'Malta'  then do;
                  if _st20 = 'Mali'  then do;
                     _2_52 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Malta'  then do;
                        _2_53 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Mexico'  then do;
                     _2_54 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _st20 <= 'Montenegro'  then do;
                  if _st20 = 'Moldova'  then do;
                     _2_55 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Montenegro'  then do;
                        _2_56 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Morocco'  then do;
                     _2_57 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
         end;
      end;
      else do;
         if _st20 <= 'Norway'  then do;
            if _st20 <= 'New Zealand'  then do;
               if _st20 <= 'Netherlands'  then do;
                  if _st20 = 'N Macedonia'  then do;
                     _2_58 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Netherlands'  then do;
                        _2_59 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'New Zealand'  then do;
                     _2_60 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _st20 <= 'Northern Ireland'  then do;
                  if _st20 = 'Nigeria'  then do;
                     _2_61 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Northern Ireland'  then do;
                        _2_62 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Norway'  then do;
                     _2_63 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
         end;
         else do;
            if _st20 <= 'Peru'  then do;
               if _st20 <= 'Panama'  then do;
                  if _st20 = 'Oman'  then do;
                     _2_64 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Panama'  then do;
                        _2_65 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Peru'  then do;
                     _2_66 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _st20 = 'Poland'  then do;
                  _2_67 = 1;
                  _dm_find = 1;
               end;
               else do;
                  if _st20 = 'Portugal'  then do;
                     _2_68 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
         end;
      end;
   end;
   else do;
      if _st20 <= 'Slovenia'  then do;
         if _st20 <= 'Saudi Arabia'  then do;
            if _st20 <= 'Romania'  then do;
               if _st20 <= 'Rep of Ireland'  then do;
                  if _st20 = 'Qatar'  then do;
                     _2_69 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Rep of Ireland'  then do;
                        _2_70 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Romania'  then do;
                     _2_71 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _st20 <= 'San Marino'  then do;
                  if _st20 = 'Russia'  then do;
                     _2_72 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'San Marino'  then do;
                        _2_73 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Saudi Arabia'  then do;
                     _2_74 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
         end;
         else do;
            if _st20 <= 'Serbia'  then do;
               if _st20 <= 'Senegal'  then do;
                  if _st20 = 'Scotland'  then do;
                     _2_75 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Senegal'  then do;
                        _2_76 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Serbia'  then do;
                     _2_77 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _st20 = 'Slovakia'  then do;
                  _2_78 = 1;
                  _dm_find = 1;
               end;
               else do;
                  if _st20 = 'Slovenia'  then do;
                     _2_79 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
         end;
      end;
      else do;
         if _st20 <= 'Tunisia'  then do;
            if _st20 <= 'Sweden'  then do;
               if _st20 <= 'Spain'  then do;
                  if _st20 = 'South Africa'  then do;
                     _2_80 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Spain'  then do;
                        _2_81 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Sweden'  then do;
                     _2_82 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _st20 <= 'Trkiye'  then do;
                  if _st20 = 'Switzerland'  then do;
                     _2_83 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'Trkiye'  then do;
                        _2_84 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Tunisia'  then do;
                     _2_85 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
         end;
         else do;
            if _st20 <= 'Uruguay'  then do;
               if _st20 <= 'United States'  then do;
                  if _st20 = 'Ukraine'  then do;
                     _2_86 = 1;
                     _dm_find = 1;
                  end;
                  else do;
                     if _st20 = 'United States'  then do;
                        _2_87 = 1;
                        _dm_find = 1;
                     end;
                  end;
               end;
               else do;
                  if _st20 = 'Uruguay'  then do;
                     _2_88 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _st20 = 'Venezuela'  then do;
                  _2_89 = 1;
                  _dm_find = 1;
               end;
               else do;
                  if _st20 = 'Wales'  then do;
                     _dm_find = 1;
                  end;
               end;
            end;
         end;
      end;
   end;
end;
if not _dm_find then do;
   _2_0 = .;
   _2_1 = .;
   _2_2 = .;
   _2_3 = .;
   _2_4 = .;
   _2_5 = .;
   _2_6 = .;
   _2_7 = .;
   _2_8 = .;
   _2_9 = .;
   _2_10 = .;
   _2_11 = .;
   _2_12 = .;
   _2_13 = .;
   _2_14 = .;
   _2_15 = .;
   _2_16 = .;
   _2_17 = .;
   _2_18 = .;
   _2_19 = .;
   _2_20 = .;
   _2_21 = .;
   _2_22 = .;
   _2_23 = .;
   _2_24 = .;
   _2_25 = .;
   _2_26 = .;
   _2_27 = .;
   _2_28 = .;
   _2_29 = .;
   _2_30 = .;
   _2_31 = .;
   _2_32 = .;
   _2_33 = .;
   _2_34 = .;
   _2_35 = .;
   _2_36 = .;
   _2_37 = .;
   _2_38 = .;
   _2_39 = .;
   _2_40 = .;
   _2_41 = .;
   _2_42 = .;
   _2_43 = .;
   _2_44 = .;
   _2_45 = .;
   _2_46 = .;
   _2_47 = .;
   _2_48 = .;
   _2_49 = .;
   _2_50 = .;
   _2_51 = .;
   _2_52 = .;
   _2_53 = .;
   _2_54 = .;
   _2_55 = .;
   _2_56 = .;
   _2_57 = .;
   _2_58 = .;
   _2_59 = .;
   _2_60 = .;
   _2_61 = .;
   _2_62 = .;
   _2_63 = .;
   _2_64 = .;
   _2_65 = .;
   _2_66 = .;
   _2_67 = .;
   _2_68 = .;
   _2_69 = .;
   _2_70 = .;
   _2_71 = .;
   _2_72 = .;
   _2_73 = .;
   _2_74 = .;
   _2_75 = .;
   _2_76 = .;
   _2_77 = .;
   _2_78 = .;
   _2_79 = .;
   _2_80 = .;
   _2_81 = .;
   _2_82 = .;
   _2_83 = .;
   _2_84 = .;
   _2_85 = .;
   _2_86 = .;
   _2_87 = .;
   _2_88 = .;
   _2_89 = .;
   _LMR_BAD=1;
   goto _SKIP_000;
end;

*** Generate design variables for YEAR;
length _st12 $ 12; drop _st12;
_st12 = left(trim(put (YEAR, BEST12.)));
_4_0= 0; 
_4_1= 0; 
_4_2= 0; 
_4_3= 0; 
_4_4= 0; 
_4_5= 0; 
_4_6= 0; 
_4_7= 0; 
_4_8= 0; 
_4_9= 0; 
_4_10= 0; 
_4_11= 0; 
_4_12= 0; 
_4_13= 0; 
_4_14= 0; 
_4_15= 0; 
_4_16= 0; 
_4_17= 0; 
_4_18= 0; 
_4_19= 0; 
_dm_find = 0; drop _dm_find;
if _st12 <= '2014'  then do;
   if _st12 <= '2009'  then do;
      if _st12 <= '2006'  then do;
         if _st12 <= '2005'  then do;
            if _st12 = '2004'  then do;
               _4_0 = 1;
               _dm_find = 1;
            end;
            else do;
               if _st12 = '2005'  then do;
                  _4_1 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _st12 = '2006'  then do;
               _4_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _st12 <= '2008'  then do;
            if _st12 = '2007'  then do;
               _4_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _st12 = '2008'  then do;
                  _4_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _st12 = '2009'  then do;
               _4_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _st12 <= '2012'  then do;
         if _st12 <= '2011'  then do;
            if _st12 = '2010'  then do;
               _4_6 = 1;
               _dm_find = 1;
            end;
            else do;
               if _st12 = '2011'  then do;
                  _4_7 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _st12 = '2012'  then do;
               _4_8 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _st12 = '2013'  then do;
            _4_9 = 1;
            _dm_find = 1;
         end;
         else do;
            if _st12 = '2014'  then do;
               _4_10 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
end;
else do;
   if _st12 <= '2019'  then do;
      if _st12 <= '2017'  then do;
         if _st12 <= '2016'  then do;
            if _st12 = '2015'  then do;
               _4_11 = 1;
               _dm_find = 1;
            end;
            else do;
               if _st12 = '2016'  then do;
                  _4_12 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _st12 = '2017'  then do;
               _4_13 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _st12 = '2018'  then do;
            _4_14 = 1;
            _dm_find = 1;
         end;
         else do;
            if _st12 = '2019'  then do;
               _4_15 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _st12 <= '2022'  then do;
         if _st12 <= '2021'  then do;
            if _st12 = '2020'  then do;
               _4_16 = 1;
               _dm_find = 1;
            end;
            else do;
               if _st12 = '2021'  then do;
                  _4_17 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _st12 = '2022'  then do;
               _4_18 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _st12 = '2023'  then do;
            _4_19 = 1;
            _dm_find = 1;
         end;
         else do;
            if _st12 = '2024'  then do;
               _dm_find = 1;
            end;
         end;
      end;
   end;
end;
if not _dm_find then do;
   _4_0 = .;
   _4_1 = .;
   _4_2 = .;
   _4_3 = .;
   _4_4 = .;
   _4_5 = .;
   _4_6 = .;
   _4_7 = .;
   _4_8 = .;
   _4_9 = .;
   _4_10 = .;
   _4_11 = .;
   _4_12 = .;
   _4_13 = .;
   _4_14 = .;
   _4_15 = .;
   _4_16 = .;
   _4_17 = .;
   _4_18 = .;
   _4_19 = .;
   _LMR_BAD=1;
   goto _SKIP_000;
end;

*** Compute Linear Predictors;
drop _LP0;
_LP0 = 0;

*** Effect: AGE;
_LP0 = _LP0 + (-0.03958473610434) * AGE;
*** Effect: MINUTES;
_LP0 = _LP0 + (0.01083341736968) * MINUTES;
*** Effect: OPPONENT_RANKING;
_LP0 = _LP0 + (0.00918080989849) * OPPONENT_RANKING;
*** Effect: ROUND_N;
_LP0 = _LP0 + (-0.06311029789351) * ROUND_N;
*** Effect: SQUAD_RANKING;
_LP0 = _LP0 + (-0.01171861198673) * SQUAD_RANKING;
*** Effect: Country;
_LP0 = _LP0 + (-1.74597137546726) * _0_0;
_LP0 = _LP0 + (-2.01433756865655) * _0_1;
_LP0 = _LP0 + (0.8555545160087) * _0_2;
_LP0 = _LP0 + (-0.46081643992739) * _0_3;
_LP0 = _LP0 + (0.51647578075784) * _0_4;
_LP0 = _LP0 + (0.1110445293253) * _0_5;
_LP0 = _LP0 + (-0.13190247426539) * _0_6;
_LP0 = _LP0 + (-1.75720434199069) * _0_7;
_LP0 = _LP0 + (-0.36339868521312) * _0_8;
_LP0 = _LP0 + (0.06317456402717) * _0_9;
_LP0 = _LP0 + (0.03327775836007) * _0_10;
_LP0 = _LP0 + (0.57279079642226) * _0_11;
_LP0 = _LP0 + (0.73843966486923) * _0_12;
_LP0 = _LP0 + (-0.805981407845) * _0_13;
*** Effect: FOOT;
_LP0 = _LP0 + (-2.53389913089361) * _1_0;
*** Effect: OPPONENT;
_LP0 = _LP0 + (0.06589782004743) * _2_0;
_LP0 = _LP0 + (-18.6584456917463) * _2_1;
_LP0 = _LP0 + (0.27870574768576) * _2_2;
_LP0 = _LP0 + (-18.5294223838184) * _2_3;
_LP0 = _LP0 + (1.49870790434634) * _2_4;
_LP0 = _LP0 + (0.85160294660931) * _2_5;
_LP0 = _LP0 + (0.27799775445235) * _2_6;
_LP0 = _LP0 + (0.00474623313601) * _2_7;
_LP0 = _LP0 + (0.01274448899465) * _2_8;
_LP0 = _LP0 + (-18.6593388714445) * _2_9;
_LP0 = _LP0 + (0.6414477451461) * _2_10;
_LP0 = _LP0 + (0.65054015733434) * _2_11;
_LP0 = _LP0 + (-18.754173833235) * _2_12;
_LP0 = _LP0 + (0.6919562411005) * _2_13;
_LP0 = _LP0 + (-17.5487592725618) * _2_14;
_LP0 = _LP0 + (0.44054304860203) * _2_15;
_LP0 = _LP0 + (1.78956572947343) * _2_16;
_LP0 = _LP0 + (0.79195214629144) * _2_17;
_LP0 = _LP0 + (0.31554011657538) * _2_18;
_LP0 = _LP0 + (1.30069732168963) * _2_19;
_LP0 = _LP0 + (0.39473146795522) * _2_20;
_LP0 = _LP0 + (-18.1054087772115) * _2_21;
_LP0 = _LP0 + (0.50671206492505) * _2_22;
_LP0 = _LP0 + (-0.01705267727859) * _2_23;
_LP0 = _LP0 + (0.76349037501) * _2_24;
_LP0 = _LP0 + (-17.8191136178734) * _2_25;
_LP0 = _LP0 + (1.02431280523377) * _2_26;
_LP0 = _LP0 + (-0.2481621316508) * _2_27;
_LP0 = _LP0 + (0.33419318968492) * _2_28;
_LP0 = _LP0 + (0.63126624109414) * _2_29;
_LP0 = _LP0 + (-0.13274551281992) * _2_30;
_LP0 = _LP0 + (0.40441174525427) * _2_31;
_LP0 = _LP0 + (0.82551493227868) * _2_32;
_LP0 = _LP0 + (0.29918000264622) * _2_33;
_LP0 = _LP0 + (0.41907430909066) * _2_34;
_LP0 = _LP0 + (0.34041864866053) * _2_35;
_LP0 = _LP0 + (0.61559423565082) * _2_36;
_LP0 = _LP0 + (0.41012456483923) * _2_37;
_LP0 = _LP0 + (-0.21787230154485) * _2_38;
_LP0 = _LP0 + (0.56173172198059) * _2_39;
_LP0 = _LP0 + (-0.73125796087273) * _2_40;
_LP0 = _LP0 + (-0.22947369024619) * _2_41;
_LP0 = _LP0 + (-0.10092206761914) * _2_42;
_LP0 = _LP0 + (-17.014242490333) * _2_43;
_LP0 = _LP0 + (0.44540652577907) * _2_44;
_LP0 = _LP0 + (0.79411102374539) * _2_45;
_LP0 = _LP0 + (1.09495073644293) * _2_46;
_LP0 = _LP0 + (-0.34845211434301) * _2_47;
_LP0 = _LP0 + (0.20397067164021) * _2_48;
_LP0 = _LP0 + (-0.54771781614896) * _2_49;
_LP0 = _LP0 + (0.7860755810014) * _2_50;
_LP0 = _LP0 + (0.59117542043242) * _2_51;
_LP0 = _LP0 + (-15.2552828436626) * _2_52;
_LP0 = _LP0 + (-0.01023170185407) * _2_53;
_LP0 = _LP0 + (0.34446791442086) * _2_54;
_LP0 = _LP0 + (-0.38569209366104) * _2_55;
_LP0 = _LP0 + (1.03344057662295) * _2_56;
_LP0 = _LP0 + (-0.7614348253977) * _2_57;
_LP0 = _LP0 + (-0.37884660396258) * _2_58;
_LP0 = _LP0 + (0.68111445645987) * _2_59;
_LP0 = _LP0 + (0.1943274607363) * _2_60;
_LP0 = _LP0 + (0.26827886278368) * _2_61;
_LP0 = _LP0 + (0.75398793500972) * _2_62;
_LP0 = _LP0 + (-0.58723665166748) * _2_63;
_LP0 = _LP0 + (0.43668952068909) * _2_64;
_LP0 = _LP0 + (1.39766779109239) * _2_65;
_LP0 = _LP0 + (1.51342015291481) * _2_66;
_LP0 = _LP0 + (0.54711324004306) * _2_67;
_LP0 = _LP0 + (0.07411296829139) * _2_68;
_LP0 = _LP0 + (0.28114121069561) * _2_69;
_LP0 = _LP0 + (0.17499749467207) * _2_70;
_LP0 = _LP0 + (1.20823669123698) * _2_71;
_LP0 = _LP0 + (0.5215794415594) * _2_72;
_LP0 = _LP0 + (0.18066103554464) * _2_73;
_LP0 = _LP0 + (0.9059470445173) * _2_74;
_LP0 = _LP0 + (0.92166883667552) * _2_75;
_LP0 = _LP0 + (0.02421363363705) * _2_76;
_LP0 = _LP0 + (-0.68503368769037) * _2_77;
_LP0 = _LP0 + (0.2257206850865) * _2_78;
_LP0 = _LP0 + (0.34565151643615) * _2_79;
_LP0 = _LP0 + (1.25765376838649) * _2_80;
_LP0 = _LP0 + (0.19672245156328) * _2_81;
_LP0 = _LP0 + (1.08598460610534) * _2_82;
_LP0 = _LP0 + (0.89359321629976) * _2_83;
_LP0 = _LP0 + (0.58301745818656) * _2_84;
_LP0 = _LP0 + (1.15942859172324) * _2_85;
_LP0 = _LP0 + (0.38667326510569) * _2_86;
_LP0 = _LP0 + (0.84496508099323) * _2_87;
_LP0 = _LP0 + (-18.4163025724963) * _2_88;
_LP0 = _LP0 + (2.83152002960427) * _2_89;
*** Effect: YEAR;
_LP0 = _LP0 + (0.54850987666341) * _4_0;
_LP0 = _LP0 + (-0.31184406608353) * _4_1;
_LP0 = _LP0 + (0.47575715203311) * _4_2;
_LP0 = _LP0 + (0.25260704064226) * _4_3;
_LP0 = _LP0 + (-0.0321403782137) * _4_4;
_LP0 = _LP0 + (-1.08875792550909) * _4_5;
_LP0 = _LP0 + (0.1812910063662) * _4_6;
_LP0 = _LP0 + (0.6718987217508) * _4_7;
_LP0 = _LP0 + (0.163682771599) * _4_8;
_LP0 = _LP0 + (1.25676154017451) * _4_9;
_LP0 = _LP0 + (0.58397707117267) * _4_10;
_LP0 = _LP0 + (0.72279141547689) * _4_11;
_LP0 = _LP0 + (1.17456255254691) * _4_12;
_LP0 = _LP0 + (1.14022615036401) * _4_13;
_LP0 = _LP0 + (1.20298647661317) * _4_14;
_LP0 = _LP0 + (1.36589567987175) * _4_15;
_LP0 = _LP0 + (1.01756329231961) * _4_16;
_LP0 = _LP0 + (1.5388865138653) * _4_17;
_LP0 = _LP0 + (1.45677795722207) * _4_18;
_LP0 = _LP0 + (1.3733438232046) * _4_19;

*** Predicted values;
_LP0 = exp(_LP0);
_SKIP_000:
if _LMR_BAD=1 then do;
   P_GOALS = .;
end;
else do;
   P_GOALS = _LP0;
end;
