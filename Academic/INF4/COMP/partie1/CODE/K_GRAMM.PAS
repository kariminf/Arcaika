{
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北
北       北                Cr俥r par:                  北       北
北       北             ARIES Abd elkarim              北       北
北       北       4i妋e ann俥 g俷ie informatique       北       北
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北
北北北北北�  北北北北北北北北�  北北北北北  北北北�   北北北北北北
北北北北北    北北北北北北北�    北北北北�  北北北  北北北北北北北
北北北北�  北  北北北北北北�  北  北北北北  北北�  北北北北北北北�
北北北北  北北  北北北北北�  北北  北北北�  北北  北北北北北北北北
北北北�  北北北  北北北北�  北北北  北北北  北�  北北北北北北北北�
北北北  北北北北  北北北�  北北北北  北北�  �   北北北北北北北北北
北北�  北北北北北  北北�  北北北北北  北北     北北北北北北北北北�
北北                北�                北�  北   北北北北北北北北�
北北  北北北北北北  北�  北北北北北北  北�  北北   北北北北北北北�
北北  北北北北北北  北�  北北北北北北  北�  北北北   北北北北北北�
北北  北北北北北北  北�  北北北北北北  北�  北北北北   北北北北北�
北北  北北北北北北  北�  北北北北北北  北�  北北北北北   北北北北�
北北  北北北北北北  北�  北北北北北北  北�  北北北北北北    北北北
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北

北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北
北       北         L'unit俥 (K_GRAMM.tpu)             北       北
北       北北北北北北北北北北北北北北北北北北北北北北北北       北
北       Elle sert � d俧inir des fonctions qu'on peut appliquer 北
北sur les grammaires (minimisation,...etc).                     北
北                                                              北
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北
北       北     R倂ision sur les grammaires            北       北
北       北北北北北北北北北北北北北北北北北北北北北北北北       北
北                                                              北
北PRODUCTIVE: il y a au moins un terminal qu'on obtient �       北
北            travers de X "Lp(X)<>0,X頟".                      北
北                                                              北
北ACCESSIBLE: u�(Vt,Vn)+ contient X頥n et S--*p--> u.           北
北                                                              北
北REDUITE   : � Productive.                                     北
北            � Accessible.                                     北
北                                                              北
北PROPRE    : � il n'existe pas une r奼le "X->Y" /X,Y � Vt.     北
北            � il n'existe pas une r奼le "X->�" / X� Vt,X<>S.  北
北                                                              北
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北
北       北       Les fonctions de cette unit俥:       北       北
北       北北北北北北北北北北北北北北北北北北北北北北北北       北
北赏屯屯屯屯屯屯送屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯突北
北篹st_type2    � 畃our savoire si la grammaire est detype 2�  罕�
北篺ct          � 甤r俛tion d'une grammaire propre r俤uite,non 罕�
北�             � r俢ursive � gauche et factoris俥 � gauche    罕�
北�             � 俼uivalente � une autre grammaire�           罕�
北篎NC          � 甤r俥r une grammaire sous forme de shomesky� 罕�
北篎NG          � 甤r俥r une grammaire sous forme de greibagh� 罕�
北韧屯屯屯屯屯屯释屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯屯图北
北                                                              北
北                                                              北
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北
北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北}

unit k_gramm;

interface
uses k_struct;

   function est_type2(gram:la_regle):boolean;
   procedure productive(gram:la_regle;var g_fct:la_regle;axiome:string);
   procedure accessible(var g_fct:la_regle;axiome:string);
   procedure sans_epsilon(var g_fct:la_regle;var axiome:string);
   procedure pas_unitaire(var g_fct:la_regle;axiome:string);
   procedure recur_gauche(var g_fct:la_regle);
   procedure FCT(gram:la_regle;var g_fct:la_regle;axiome:string);
   procedure FNC(gram:la_regle;var g_fnc:la_regle);
   procedure FNG(gram:la_regle;var g_fng:la_regle);
   procedure nouv_terminal(s:string;var nbv,nbn:integer;term:boolean);
   procedure donne_axiome(var val:string;Npos:integer);
   procedure positioner_ensemble(Vpos,Npos:integer;term:boolean);
   procedure positioner_regle(Rpos,TypeR:integer);
   function lecture_ensemble(term:boolean):string;
   procedure lecture_partie(gauche:boolean;var val:string;var term:boolean);
   function fin_ensemble(term:boolean):boolean;
   procedure regle_suiv;
   function fin_lect_partie(gauche:boolean):boolean;
   function fin_lect_regle:boolean;
   function nouv_struct(partieGD,num:integer;term:boolean):string;
   procedure mise_a_jour(var nbFCT,nbFNC,nbFNG:integer;var G_type2:boolean);
   function laxiome(S:boolean):string;
   procedure destruction;

implementation
var __G,__Gp,__G1,__G2,__tmp_r:la_regle;
    __V,__N,__tmp_v,__tmp_n,__GA,__DR,__GAtmp,__DRtmp:partie;
    __S,__S2:string;
{*************************************************************************
**************************************************************************}
{畃our savoire si la grammaire est detype 2瘆
function est_type2(gram:la_regle):boolean;
var oui:boolean;
begin
   {A-->w / A頝,w�(V,N)*}
   oui:=true;
   while(oui)and(gram<>nil)do {pour tous les r奼les}
   begin
      if gram^.gauche^.terminal<>false then
         oui:=false{si on trouve qu'il y a une r奼le qui contient un terminal
                    � gauche on conclut que la grammaire n'est pas de type2}
      else
         if gram^.gauche^.suiv<>nil then
            oui:=false;{si on trouve qu'il y a plus de 2 lexemes on conclut
                       que la grammaire pas de type2}
      gram:=gram^.regle_suiv;{r奼le_suivante}
   end;{jusqu'� la fin des r奼les}
   est_type2:=oui;
end;

{*************************************************************************
**************************************************************************}
{畃our rendre une grammaire productive瘆
procedure productive(gram:la_regle;var g_fct:la_regle;axiome:string);
var tmp_regle:la_regle;
    tmp_partie,ens: partie;
    Ni,Ni1:integer;
begin

{------Productive--------}
{------Productive--------}
{------Productive--------}
   g_fct:=nil;
   {1: ens0=[x頝/X-->� , 囝V*]}
   ens:=nil;
   Ni:=0;
   Ni1:=0;
   tmp_regle:=gram;
   while tmp_regle<>nil do
   begin
      if tous_terminal(tmp_regle^.droite) then
         begin
            copy_regle(tmp_regle,g_fct);
            nouvelle_partie(ens,tmp_regle^.gauche^.val,false);
            Ni1:=Ni1+1;
         end;
      tmp_regle:=tmp_regle^.regle_suiv;
   end;
   {2: ens1=ens0 union [x頝/x-->� , 囝(v,ens0)*]}
   repeat
      Ni:=Ni1;
      tmp_regle:=gram;
      while tmp_regle<>nil do
      begin
         if consiste_de(tmp_regle,g_fct) then
         {si tmp_regle consiste des non terminaux gauches de g_fct et des terminaux}
            if not est_dans(tmp_regle,g_fct) then
            {si cette regles "tmp_regle" n'existe pas dans "g_fct"}
            begin
               Ni1:=Ni1+1;
               copy_regle(tmp_regle,g_fct);
               nouvelle_partie(ens,tmp_regle^.gauche^.val,false);
            end;

         tmp_regle:=tmp_regle^.regle_suiv;
      end;
   until Ni1=Ni;
   {jusqu'� g_fct stable}
   if not in_partie(ens,axiome) then
   begin
      sup_tot_partie(ens);
      sup_tot_gram(g_fct);
      tmp_partie:=nil;
      ens:=nil;
      g_fct:=nil;
      nouvelle_partie(ens,axiome,false);
      nouvelle_partie(tmp_partie,'',true);
      nouvelle_regle(g_fct,ens,tmp_partie);{la seul r奼le est axiome-->題
   end
   else
      sup_tot_partie(ens);
{------FIN Productive--------}
end;

{*************************************************************************
**************************************************************************}
{畃our rendre une grammaire accessible瘆
procedure accessible(var g_fct:la_regle;axiome:string);
var tmp_regle:la_regle;
    tmp_partie,ens: partie;
    Ni,Ni1:integer;
begin
{------Accessible--------}
{------Accessible--------}
{------Accessible--------}
   ens:=nil;
   nouvelle_partie(ens,axiome,false);
   Ni:=0;
   Ni1:=1;{la liste ne contient que l'axiome}
   {on cherche la liste des regles accessibles par S}
   while Ni<>Ni1 do
   begin
      Ni:=Ni1;
      tmp_regle:=g_fct;
      while tmp_regle<>nil do
      begin
         if in_partie(ens,tmp_regle^.gauche^.val) then
         begin
            tmp_partie:=tmp_regle^.droite;
            while tmp_partie<>nil do
            begin
               if not tmp_partie^.terminal then
                  if not in_partie(ens,tmp_partie^.val) then
                  begin
                     nouvelle_partie(ens,tmp_partie^.val,false);
                     Ni1:=Ni1+1;
                  end;
               tmp_partie:=tmp_partie^.suiv;
            end;
         end;
         tmp_regle:=tmp_regle^.regle_suiv;
      end;
   end;
   {suppression des regles que le non terminal de gauche n'appartient
   pas � la liste des accessibles "ens"}
   tmp_regle:=g_fct;
   while tmp_regle<>nil do
   begin
      if not in_partie(ens,tmp_regle^.gauche^.val) then
         sup_regle(tmp_regle,g_fct);
      tmp_regle:=tmp_regle^.regle_suiv;
   end;
   {suppression des r奼les dont elles contiennent un non terminal � droite
   n'appartient pas � la liste des accessibles"ens"}
   tmp_regle:=g_fct;
   while tmp_regle<>nil do
   begin
      if not est_appartient(ens,tmp_regle^.droite) then
         sup_regle(tmp_regle,g_fct);
      tmp_regle:=tmp_regle^.regle_suiv;
   end;
   {suppression de la liste de non terminaux gauches des r奼les accessibles}
   sup_tot_partie(ens);
{------FIN Accessible--------}
end;

{*************************************************************************
**************************************************************************}
{畃our rendre une grammaire sans �-r奼les瘆
procedure sans_epsilon(var g_fct:la_regle;var axiome:string);
var tmp_regle,rgl:la_regle;
    ens,tmp_ens,g,d: partie;
    Ni,Ni1:integer;
    found:boolean;
begin
{------Pas de �-r奼les--------}
{------Pas de �-r奼les--------}
{------Pas de �-r奼les--------}
   Ni1:=0;Ni:=0;
   tmp_regle:=g_fct;
   ens:=nil;
   {1: les r奼les qui contiennent des � "X-->�" 俶idiates}
   while tmp_regle<>nil do
   begin
      if tmp_regle^.droite^.terminal then
         if tmp_regle^.droite^.val='' then
         begin
            nouvelle_partie(ens,tmp_regle^.gauche^.val,false);
            sup_regle(tmp_regle,g_fct);
            Ni1:=Ni1+1;
         end;
      tmp_regle:=tmp_regle^.regle_suiv;
   end;

   if Ni1<>0 then {s'il y a au moin une regle de la forme "X-->�"}
   begin

      {2: les r奼les qui contiennent des � "X-->�" apr俿 certaines transitions}
      while Ni1<>Ni do
      begin
         Ni:=Ni1;
         tmp_regle:=g_fct;
         while tmp_regle<>nil do
         begin
            if tous_sont_que(tmp_regle^.droite,ens) then
            begin
               if not in_partie(ens,tmp_regle^.gauche^.val) then
                  nouvelle_partie(ens,tmp_regle^.gauche^.val,false);
               sup_regle(tmp_regle,g_fct);
               Ni1:=Ni1+1;
            end;
            tmp_regle:=tmp_regle^.regle_suiv;
         end;
      end;

      {3: on cherche qu'il y a des non terminaux appartennants � "ens" et qui
      s'apparaient d'une autre r奼le avec partie droite non vide
      exp: A--->Ax|題
      tmp_regle:=g_fct;
      while tmp_regle<>nil do
      begin
         if in_partie(ens,tmp_regle^.gauche^.val) then
         begin
            tmp_ens:=ens;
            while (tmp_ens^.val<>tmp_regle^.gauche^.val)do
               tmp_ens:=tmp_ens^.suiv;
            tmp_ens^.terminal:=true;{ici terminal sign俧ie que le non}
         end;                       {a une partie droite<>題
         tmp_regle:=tmp_regle^.regle_suiv;
      end;

      {4: ici on elimine les non terminaux � droite des r奼les et qui
      conduitent � � }
      tmp_regle:=g_fct;
      while tmp_regle<>nil do
      begin
         found:=_autre_regle_de(tmp_regle^.droite,ens);
         if found then
         begin
            rgl:=nil;
            copy_regle(tmp_regle,rgl);
            elimine_de(tmp_regle,ens,false);{n'eliminie pas tous les N頴ns}
            elimine_de(rgl,ens,true);
            rgl^.regle_suiv:=tmp_regle^.regle_suiv;
            tmp_regle^.regle_suiv:=rgl;
            tmp_regle:=rgl;
         end
         else
            elimine_de(tmp_regle,ens,true);
         tmp_regle:=tmp_regle^.regle_suiv;
      end;

      {5: si l'axiome appartient � ens et apparait � la partie droite
      d'une autre r奼le donc on cr俥 un autre axiome}
      if in_liste(ens,axiome) then
      begin
         found:=false;
         tmp_regle:=g_fct;
         while (tmp_regle<>nil) and (not found) do
         begin
            if tmp_regle^.gauche^.val<>axiome then
               if in_partie(tmp_regle^.droite,axiome)then
                  found:=true;
            tmp_regle:=tmp_regle^.regle_suiv;
         end;
         if found then
         begin
            g:=nil;
            d:=nil;
            nouvelle_partie(g,'S�',false);
            nouvelle_partie(d,axiome,false);
            nouvelle_regle(g_fct,g,d);{ajout S�-->[axiome]}
            axiome:='S�';
         end;
         g:=nil;
         d:=nil;
         nouvelle_partie(g,axiome,false);
         nouvelle_partie(d,'',true);
         nouvelle_regle(g_fct,g,d);{ajout [axiome]-->題
      end;

      {6:suppression de la liste des non terminants donnants un 題
      sup_tot_partie(ens);
   end;
{------FIN Pas de �-r奼les--------}
end;

{*************************************************************************
**************************************************************************}
{畃our rendre une grammaire non unitaire瘆
procedure pas_unitaire(var g_fct:la_regle;axiome:string);
var tmp_regle,tmp_regle2,ens_regle,nouv:la_regle;
    d,g: partie;
    gauche:string;
    Ni,Ni1:integer;
    bool:boolean;
begin

{-------Pas de r奼les unitaires--------}
{-------Pas de r奼les unitaires--------}
{-------Pas de r奼les unitaires--------}
   (*on va cr俥r une ensemble des non terminaux de g_fct N0(X)={X} *)
   tmp_regle:=g_fct;
   ens_regle:=nil;
   while tmp_regle<>nil do
   begin
      tmp_regle2:=ens_regle;
      bool:=true;{veut dire qu'il n'y a pas ce non terminal dans la liste}
      while bool and (tmp_regle2<>nil) do
      begin
         if tmp_regle2^.gauche^.val=tmp_regle^.gauche^.val then
            bool:=false;
         tmp_regle2:=tmp_regle2^.regle_suiv;
      end;
      if bool then
      begin
         g:=nil;
         d:=nil;
         nouvelle_partie(g,tmp_regle^.gauche^.val,false);
         nouvelle_partie(d,tmp_regle^.gauche^.val,false);
         nouvelle_regle(ens_regle,g,d);
      end;
      tmp_regle:=tmp_regle^.regle_suiv;
   end;
   {on a cr倐 la liste des non terminaux de g_fct N"0"(X)}
   {on va calculer les N(X) /qque soit X � N}
   (*     N"i+1"(X):=N"i"(X)+{Y頝/ A-->Y, A頝"i"(X)}    *)
   tmp_regle2:=ens_regle;
   while tmp_regle2<>nil do
   begin
      tmp_regle:=g_fct;
      Ni1:=0;
      Ni:=0;
      repeat
         Ni:=Ni1;
         while tmp_regle<>nil do
         begin
            if unitaire(tmp_regle^.droite) then {si la r奼le est unitaire}
            {X頝===tmp_regle2^.gauche^.val;;;N(X)===tmp_regle2^.droite}
               if not in_partie(tmp_regle2^.droite,tmp_regle^.droite^.val) then
               {si le non terminal droit de cette regle n'appartient pas �
               la liste de X : N(X) on l'ajoute}
                  if in_partie(tmp_regle2^.droite,tmp_regle^.gauche^.val) then
                  {si la partie gauche de la r奼le 俫ale � X}
                  begin
                     nouvelle_partie(tmp_regle2^.droite,tmp_regle^.droite^.val,false);
                     Ni1:=Ni1+1;
                  end;
            tmp_regle:=tmp_regle^.regle_suiv;
         end;
      until Ni1=Ni;
      tmp_regle2:=tmp_regle2^.regle_suiv;
   end;

   {ici on a donc la liste N(X)}
   nouv:=nil;
   tmp_regle:=g_fct;
   while tmp_regle<>nil do
   begin
      if unitaire(tmp_regle^.droite)then
         sup_regle(tmp_regle,g_fct)
      else
      begin
         tmp_regle2:=ens_regle;
         while tmp_regle2 <>nil do
         begin
            if tmp_regle^.gauche^.val<>tmp_regle2^.gauche^.val then
            {puisque on a d俲a B--->� dans g_fct}
               if in_partie(tmp_regle2^.droite,tmp_regle^.gauche^.val) then
               {si B頝(A)/B-->� donc on cr俥 A-->鄛
               begin
                  d:=nil;
                  g:=nil;
                  nouvelle_partie(g,tmp_regle2^.gauche^.val,false);
                  copy_partie(tmp_regle^.droite,d);
                  nouvelle_regle(nouv,g,d);
               end;
            tmp_regle2:=tmp_regle2^.regle_suiv;
         end;
      end;
      tmp_regle:=tmp_regle^.regle_suiv;
   end;

   {si cette regle sera inutile(pas accessible d'autres, on la supprime}
   tmp_regle:=g_fct;
   while tmp_regle<>nil do
   begin
      if tmp_regle^.gauche^.val<>axiome then
         if (not existe_partie_droite(g_fct,tmp_regle^.gauche^.val))then
            sup_regle(tmp_regle,g_fct);
      tmp_regle:=tmp_regle^.regle_suiv;
   end;

   if g_fct=nil then
      g_fct:=nouv
   else
   begin
      tmp_regle:=g_fct;
      while tmp_regle^.regle_suiv<>nil do
         tmp_regle:=tmp_regle^.regle_suiv;
      tmp_regle^.regle_suiv:=nouv;
   end;

   sup_tot_gram(ens_regle);

{-------FIN Pas de r奼les unitaires--------}
end;

{*************************************************************************
**************************************************************************}
{畃our rendre une grammaire pas recursive � gauche瘆
procedure recur_gauche(var g_fct:la_regle);
var tmp_regle,tmp_regle2,ens_regle:la_regle;
    tmp_partie,ens,d,g: partie;
    gauche:string;
    Ni,Ni1,compteur:integer;
    bool:boolean;
begin
{------Non r俢ursive � gauche--------}
{------Non r俢ursive � gauche--------}
{------Non r俢ursive � gauche--------}

   compteur:=0;
   tmp_regle:=g_fct;
   while tmp_regle<>nil do
   begin
      if not tmp_regle^.droite^.terminal then
      begin
         if recur_imediat(tmp_regle) then
         begin
            ens_regle:=nil;
            tmp_partie:=nil;
            copy_partie(tmp_regle^.droite,tmp_partie);{tmp_partie==Aw}
            tmp_regle2:=tmp_regle^.regle_suiv;
            sup_regle(tmp_regle,g_fct);
            tmp_regle:=tmp_regle2;
            tmp_regle2:=g_fct;       {A-->Aw}
            while tmp_regle2<>nil do {pour tous A-->v}
            begin
               if (tmp_regle2^.gauche^.val=tmp_partie^.val)and (not recur_imediat(tmp_regle2))then
               begin
                  g:=nil;
                  d:=nil;
                  writeln('je suis dans les recur emidiats');
                  nouvelle_partie(g,tmp_partie^.val,false);
                  str(compteur,gauche);
                  gauche:='R�'+ gauche;
                  compteur:=compteur+1;
                  copy_avec_nouv(d,tmp_regle2^.droite,gauche);
                  nouvelle_regle(ens_regle,g,d);{on a cr倐 A-->v弣
                  g:=nil;
                  d:=nil;
                  nouvelle_partie(g,gauche,false);
                  copy_avec_nouv(d,tmp_partie^.suiv,gauche);
                  nouvelle_regle(ens_regle,g,d);{on a cr倐 �-->w弣
                  d:=nil;
                  g:=nil;
                  nouvelle_partie(g,gauche,false);
                  copy_partie(tmp_partie^.suiv,d);
                  nouvelle_regle(ens_regle,g,d);
               end;
               tmp_regle2:=tmp_regle2^.regle_suiv;
            end;
            sup_tot_partie(tmp_partie);
            concat_gram(g_fct,ens_regle);
            writeln('jdjfdfdhfhdhf');
         end
         else {il n'y a pas de r俢ursion im俤iate donc on va chercher l'autre}
            if not recur_loin(tmp_regle,g_fct) then
               tmp_regle:=tmp_regle^.regle_suiv;
      end
      else
         tmp_regle:=tmp_regle^.regle_suiv;
   end;
{------FIN Non r俢ursive � gauche--------}
end;

{*************************************************************************
**************************************************************************}
{畃our rendre une grammaire productive瘆
procedure fct(gram:la_regle;var g_fct:la_regle;axiome:string);
var tmp_regle,tmp_regle2,ens_regle:la_regle;
    tmp_partie,ens: partie;
    gauche:string;
    Ni,Ni1:integer;
    bool:boolean;
label axiome_nul;
begin
{------Factoris俥 � gauche--------}
{------Factoris俥 � gauche--------}
{------Factoris俥 � gauche--------}

{------FIN Factoris俥 � gauche--------}

end;

{*************************************************************************
**************************************************************************}
{甤r俥r une grammaire sous forme de shomesky瘆
procedure FNC(gram:la_regle;var g_fnc:la_regle);
var g,d,tmp_partie:partie;
    gauche,gauche1,gauche2,tmp:string;
    compteur:integer;
begin
   compteur:=0;
while gram<>nil do
   begin
      gauche:=gram^.gauche^.val;
      tmp_partie:=gram^.droite;
      while tmp_partie<>nil do
      begin
         if est_fnc(tmp_partie) then
         begin
            d:=nil;
            g:=nil;
            nouvelle_partie(g,gauche,false);
            while tmp_partie<>nil do
            begin
               nouvelle_partie(d,tmp_partie^.val,tmp_partie^.terminal);
               tmp_partie:=tmp_partie^.suiv;
            end;
            nouvelle_regle(g_fnc,g,d);
         end
         else
         begin
            if tmp_partie^.terminal then
            begin
               if not N_definit_seul(g_fnc,gauche1,'C�',tmp_partie^.val) then
               begin
                  str(compteur,gauche1);
                  gauche1:='C�'+ gauche1;
                  compteur:=compteur+1;
                  d:=nil;
                  g:=nil;
                  nouvelle_partie(g,gauche1,false);
                  nouvelle_partie(d,tmp_partie^.val,true);
                  nouvelle_regle(g_fnc,g,d);
               end;
            end
            else
               gauche1:=tmp_partie^.val;

            tmp_partie:=tmp_partie^.suiv;

            if tmp_partie^.suiv=nil then
            begin
               if tmp_partie^.terminal then
               begin
                  if not N_definit_seul(g_fnc,gauche2,'C�',tmp_partie^.val) then
                  begin
                     str(compteur,gauche2);
                     gauche2:='C�'+gauche2;
                     compteur:=compteur+1;
                     d:=nil;
                     g:=nil;
                     nouvelle_partie(g,gauche2,false);
                     nouvelle_partie(d,tmp_partie^.val,true);
                     nouvelle_regle(g_fnc,g,d);
                  end;
               end
               else
                  gauche2:=tmp_partie^.val;
               tmp_partie:=nil;
            end
            else
            begin
               str(compteur,gauche2);
               gauche2:='C�'+gauche2;
               compteur:=compteur+1;
            end;{tmp_partie^.suiv<>nil }
            d:=nil;
            g:=nil;
            nouvelle_partie(g,gauche,false);
            nouvelle_partie(d,gauche1,false);
            nouvelle_partie(d,gauche2,false);
            nouvelle_regle(g_fnc,g,d);
            gauche:=gauche2;
         end;{if not est_fnc(tmp_partie)}

      end;{while tmp_partie<>nil}
      gram:=gram^.regle_suiv;
   end;{while gram<>nil}
end;

{*************************************************************************
**************************************************************************}
{甤r俥r une grammaire sous forme de greibach瘆
procedure FNG(gram:la_regle;var g_fng:la_regle);
var g,d,tmp_partie,nouv_partie:partie;
    une_regle,tmp_regle:la_regle;
    gauche:string;
    compteur:integer;
    bool:boolean;
begin
   compteur:=0;
   g_fng:=nil;
   while gram<>nil do
   begin
      copy_regle(gram,g_fng);
      gram:=gram^.regle_suiv;
   end;

   une_regle:=g_fng;
   while une_regle<>nil do
   begin
      tmp_partie:=une_regle^.droite;
      {si la r奼le est sous fng on la laisse telle qu'elle est}
      if not est_fng(tmp_partie) then
      begin
         if tmp_partie^.terminal then
         begin
            {exemple:
                    A--->aBc}
            tmp_partie:=tmp_partie^.suiv;
            while tmp_partie<>nil do
            begin
               if tmp_partie^.terminal then
               begin
                  d:=nil;
                  g:=nil;
                  if not N_definit_seul(g_fng,gauche,'G�',tmp_partie^.val) then
                  begin
                     str(compteur,gauche);
                     gauche:='G�'+ gauche;
                     compteur:=compteur+1;
                     nouvelle_partie(g,gauche,false);
                     nouvelle_partie(d,tmp_partie^.val,true);
                     nouvelle_regle(g_fng,g,d);
                     {on a cr倐 une r奼le  G�0--->c}
                  end;
                  tmp_partie^.val:=gauche;
                  tmp_partie^.terminal:=false;
                  {la partie sera "a B G�0"}
               end;{tmp_partie^.terminal}
               tmp_partie:=tmp_partie^.suiv;
            end;
         end
         else{not tmp_partie^.terminal pour le premier doite de la r奼le}
         begin
            {exemple:
                    A--->Bc ;B--->aD }
            tmp_regle:=g_fng;
            bool:=true;
            nouv_partie:=nil;

            copy_partie(tmp_partie,nouv_partie);
            while bool and (tmp_regle<>nil) do
            begin
               if tmp_regle^.gauche^.val=tmp_partie^.val then
                  bool:=false
               else
                  tmp_regle:=tmp_regle^.regle_suiv;
            end;
            {remplacement du premier par une seul production}
            remplacer_premier(une_regle^.droite,tmp_regle^.droite);
            {remplacement par les autres s'ils existent}
            while tmp_regle<>nil do
            begin
               if tmp_regle^.gauche^.val=nouv_partie^.val then
               begin
                  d:=nil;
                  g:=nil;
                  nouvelle_partie(g,une_regle^.gauche^.val,false);
                  copy_concaten(d,tmp_regle^.droite,nouv_partie^.suiv);
                  nouvelle_regle(g_fng,g,d);
               end;
               tmp_regle:=tmp_regle^.regle_suiv;
            end;
            sup_tot_partie(nouv_partie);
         end;{not tmp_partie^.terminal}
      end{not est_fng(tmp_partie)}
      else
         une_regle:=une_regle^.regle_suiv;
   end;{while une_regle<>nil}
end;

{*************************************************************************
**************************************************************************}
{� la procedure de cr俛tion de la liste des (non) terminaux瘆
procedure nouv_terminal(s:string;var nbv,nbn:integer;term:boolean);
begin

   if s<>'' then
      if term then
      begin
         if not in_liste(__V,s)then
         begin
            nouvelle_partie(__V,s,true);
            nbv:=nbv+1
         end;
      end
      else
      begin
         if not in_liste(__N,s)then
         begin
            nouvelle_partie(__N,s,false);
            nbn:=nbn+1;
         end;
      end;
end;

{*************************************************************************
**************************************************************************}
{� la procedure de choix d'axiome瘆
procedure donne_axiome(var val:string;Npos:integer);
var i:integer;
begin
   __tmp_n:=__N;
   i:=1;
   while (__tmp_n<>nil) and (i<=Npos)do
   begin
      __tmp_n:=__tmp_n^.suiv;
      i:=i+1;
   end;
   __S:=__tmp_n^.val;
   val:=__tmp_n^.val;
end;

{*************************************************************************
**************************************************************************}
{畃ositionne le pointeur sur le premier qui doit etre afficher瘆
procedure positioner_ensemble(Vpos,Npos:integer;term:boolean);
var i:integer;
begin
   i:=1;
   if term then
   begin
      __tmp_v:=__V;
      while (__tmp_v<>nil) and (i<=Vpos)do
      begin
         __tmp_v:=__tmp_v^.suiv;
         i:=i+1;
      end;
   end
   else
   begin
      __tmp_n:=__N;
      while (__tmp_n<>nil) and (i<=Npos)do
      begin
         __tmp_n:=__tmp_n^.suiv;
         i:=i+1;
      end;
   end;

end;

{*************************************************************************
**************************************************************************}
{畃ositionne le pointeur sur une regle瘆
procedure positioner_regle(Rpos,TypeR:integer);
var i:integer;
begin
   i:=1;
   case TypeR of
      0:{regle initiale}
           __tmp_r:=__G;
      1:{regle apres fonction}
           __tmp_r:=__Gp;
      2:{regle FNC}
           __tmp_r:=__G1;
      3:{regle FNG}
           __tmp_r:=__G2;
   end;
   while (__tmp_r<>nil)and(i<=Rpos)do
   begin
      __tmp_r:=__tmp_r^.regle_suiv;
      i:=i+1;
   end;
   if __tmp_r<>nil then
   begin
      __GAtmp:=__tmp_r^.gauche;
      __DRtmp:=__tmp_r^.droite;
   end;

end;

{*************************************************************************
**************************************************************************}
{� la procedure qui lit un (non)terminal de la liste瘆
function lecture_ensemble(term:boolean):string;
begin
   lecture_ensemble:='';
   if term then
   begin
      if __tmp_v<>nil then
      begin
         lecture_ensemble:=__tmp_v^.val;
         __tmp_v:=__tmp_v^.suiv;
      end;
   end
   else
   begin
      if __tmp_n<>nil then
      begin
         lecture_ensemble:=__tmp_n^.val;
         __tmp_n:=__tmp_n^.suiv;
      end;
   end;
end;
{*************************************************************************
**************************************************************************}
{� la regle suivante瘆
procedure regle_suiv;
begin
   if __tmp_r <>nil then
   begin
      __tmp_r:=__tmp_r^.regle_suiv;
      __GAtmp:=__tmp_r^.gauche;
      __DRtmp:=__tmp_r^.droite;
   end;
end;

{*************************************************************************
**************************************************************************}
{� la procedure qui lire une partie 瘆
procedure lecture_partie(gauche:boolean;var val:string;var term:boolean);
begin
   if gauche then
   begin
      if __GAtmp<>nil then
      begin
         val:=__GAtmp^.val;
         term:=__GAtmp^.terminal;
         __GAtmp:=__GAtmp^.suiv;
      end;
   end
   else
   begin
      if __DRtmp<>nil then
      begin
         val:=__DRtmp^.val;
         term:=__DRtmp^.terminal;
         __DRtmp:=__DRtmp^.suiv;
      end;
   end;
end;


{*************************************************************************
**************************************************************************}
{� la fonction qui dire que la liste a 倀� fini瘆
function fin_ensemble(term:boolean):boolean;
begin
   fin_ensemble:=false;
   if term then
   begin
      if __tmp_v=nil then
         fin_ensemble:=true;
   end
   else
   begin
      if __tmp_n=nil then
         fin_ensemble:=true;
   end;
end;

{*************************************************************************
**************************************************************************}
{� la fonction qui dire que la liste gauche ou droite a 倀� fini瘆
function fin_lect_partie(gauche:boolean):boolean;
begin
   fin_lect_partie:=false;
   if gauche then
   begin
      if __GAtmp=nil then
         fin_lect_partie:=true;
   end
   else
   begin
      if __DRtmp=nil then
         fin_lect_partie:=true;
   end;
end;
{*************************************************************************
**************************************************************************}
{� la fonction qui dire que les r奼le sont finies瘆
function fin_lect_regle:boolean;
begin
   fin_lect_regle:=false;
      if __tmp_r=nil then
         fin_lect_regle:=true;
end;

{*************************************************************************
**************************************************************************}
{� la fonction qui cr俥 une nouvelle regle瘆
function nouv_struct(partieGD,num:integer;term:boolean):string;
var ptr:partie;
    i:integer;
begin
   i:=1;
   if term then
      ptr:=__V
   else
      ptr:=__N;
   while (i<=num)and(ptr<>nil)do
   begin
      ptr:=ptr^.suiv;
      i:=i+1;
   end;
   nouv_struct:=ptr^.val;
   case partieGD of
      0: nouvelle_partie(__GA,ptr^.val,ptr^.terminal);
      1: nouvelle_partie(__DR,ptr^.val,ptr^.terminal);
      2: nouvelle_partie(__DR,'',true);{le mot vide}
      3: begin
            nouvelle_regle(__G,__GA,__DR);
            __GA:=nil;
            __DR:=nil;
         end;
      4: sup_tot_partie(__GA);
      5: begin
            sup_tot_partie(__GA);
            sup_tot_partie(__DR);
         end;
   end;
end;

function gram_non_vide(gram:la_regle):boolean;
var b:boolean;
begin
   b:=true;
   if gram^.regle_suiv=nil then
      if gram^.droite^.suiv=nil then
         if gram^.droite^.val='' then
            b:=false;
   gram_non_vide:=b;
end;

procedure mise_a_jour(var nbFCT,nbFNC,nbFNG:integer;var G_type2:boolean);
var tmpo:la_regle;
    i:integer;
begin
   {la suppression des grammaires si elles existent}
   sup_tot_gram(__Gp);
   sup_tot_gram(__G1);
   sup_tot_gram(__G2);
   G_type2:=est_type2(__G);
   if (G_type2)and(__S<>'') then
   begin
      __S2:=__S;
      productive(__G,__Gp,__S2);
      if gram_non_vide(__Gp) then
      begin
         accessible(__Gp,__S2);
         sans_epsilon(__Gp,__S2);
         pas_unitaire(__Gp,__S2);
         recur_gauche(__Gp);
      end;
      FNC(__Gp,__G1);
      FNG(__G1,__G2);

      {le nombre des regles de chaque nouvelle grammaire}

      i:=0;
      tmpo:=__Gp;
      while tmpo<>nil do
      begin
         tmpo:=tmpo^.regle_suiv;
         i:=i+1;
      end;
      nbFCT:=i;

      i:=0;
      tmpo:=__G1;
      while tmpo<>nil do
      begin
         tmpo:=tmpo^.regle_suiv;
         i:=i+1;
      end;
      nbFNC:=i;

      i:=0;
      tmpo:=__G2;
      while tmpo<>nil do
      begin
         tmpo:=tmpo^.regle_suiv;
         i:=i+1;
      end;
      nbFNG:=i;

   end;
end;


function laxiome(S:boolean):string;
begin
   if S then
      laxiome:=__S
   else
      laxiome:=__S2;
end;

procedure destruction;
begin
   sup_tot_gram(__G);
   sup_tot_gram(__Gp);
   sup_tot_gram(__G1);
   sup_tot_gram(__G2);
   __G:=nil;
   __Gp:=nil;
   __G1:=nil;
   __G2:=nil;
   __tmp_r:=nil;
   sup_tot_partie(__V);
   Sup_tot_partie(__N);
   __V:=nil;
   __N:=nil;
   __tmp_v:=nil;
   __tmp_n:=nil;
   __GA:=nil;
   __DR:=nil;
   __GAtmp:=nil;
   __DRtmp:=nil;
   __S:='';
end;

begin {initialisation}

end.