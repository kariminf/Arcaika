Attribute VB_Name = "m1"
'//////////////////////////////////////////////////////////////
'//                       INTRODUCTION                       //
'//////////////////////////////////////////////////////////////
Global bn As Integer


'   Salut,
' Apparemment tu voudrais un peut d'aide pour faire des feuilles
' non-rectangulaires ...

'Voil� :

'Pour faire des fen�tres non-rectangulaire, on doit d'abord
'cr�er une R�gion : c'est comme une sorte de dessin � deux
'couleurs (plein ou vide) que l'on va ensuite appliquer � une
'fen�tre.

'Les zones de la fen�tre correspondant � le couleur "plein"
'seront visibles.
'Celles correspondant � la couleur "vide" seront invisibles.

'Les zones cr�e sont identifi�es grace � leur Handle. Il sagit
'd'un num�ro unique attribu� pour identifier tous les objets :
'Boutons, Fen�tres, R�gions, TextBox, etc.

'Note : Pour utiliser ces fonctions, il te suffira de rajouter
'ce module � ton projet.

'//////////////////////////////////////////////////////////////
'//                    CREER DES REGIONS                     //
'//////////////////////////////////////////////////////////////

' Pour Cr�er des r�gions il faut utiliser une des fonctions
' suivante :
'(Les coordonn�e des points sont exprim�es en pixels)


'CREER DES RECTANGLES
'Pour cr�er un r�gion en forme de rectangle :
 Declare Function CreateRectRgn Lib "gdi32" ( _
ByVal X1 As Long, _
ByVal Y1 As Long, _
ByVal X2 As Long, _
ByVal Y2 As Long) _
As Long
'X1 et Y1 indiquent les coordonn�es du coin sup�rieur droit
'X2 et Y2 indiquent les coordonn�es du coin inf�rieur gauche
'Cette fonction revoie le Handle de la r�gion cr�e


'CREER DES ELLIPSES
'Pour cr�er une r�gion en forme d'ellipse :

Declare Function CreateEllipticRgn Lib "gdi32" ( _
ByVal X1 As Long, _
ByVal Y1 As Long, _
ByVal X2 As Long, _
ByVal Y2 As Long) _
As Long
'Cette fonction cr�e une ellipse qui rentre dans le rectangle
'form�e avec les coordon�es X1, X2, Y1, Y2
'Cette fonction revoie le Handle de la r�gion cr�e


'CREER DES POLYGONES
'Pour cr�er une r�gion ayant la forme d'un polygone
Declare Function CreatePolygonRgn Lib "gdi32" ( _
lpPoint As POINTAPI, _
ByVal nCount As Long, _
ByVal nPolyFillMode As Long _
) As Long

'lpPoint est un tableau d�signant les coins du polygone
'Il est de type POINTAPI :
Type POINTAPI
        X As Long
        Y As Long
End Type

'nCount d�signe le nombre de coins du polygone.

'nPolyFillMode d�signe le mode de remplissage.
'tu peux utiliser les constantes suivantes
Public Const ALTERNATE = 1
Public Const WINDING = 2
'J'avoue que je ne comprend pas la diff�rence entre les deux,
'Tu peut mettre 1, �a marche bien.



'//////////////////////////////////////////////////////////////
'//                  COMBINER DES REGIONS                    //
'//////////////////////////////////////////////////////////////


'Maintenant que nous pouvons cr�er des r�gions, voici comment
'les combiner pour cr�er des r�gions complexes.

'Il faut utiliser la fonction :

Declare Function CombineRgn Lib "gdi32" ( _
ByVal hDestRgn As Long, _
ByVal hSrcRgn1 As Long, _
ByVal hSrcRgn2 As Long, _
ByVal nCombineMode As CombineMode _
) As Long

'hDestRgn d�signe le Handle de la r�gion de destination.
'/--------------------------------------------------------\
'|ATTENTION : POUR QUE CELA FONCTIONNE, IL FAUT ABSOLUMENT|
'|QUE LA REGION SOIT DEJA INITIALISEE A L'AIDE D'UNE DES  |
'|FONCTIONS VUE CI-DESSUS.                                |
'\--------------------------------------------------------/

'hSrcRgn1 d�signe le Handle de la premi�re R�gion � combiner
'hSrcRgn2 d�signe le Handle de la deuxi�me R�gion � combiner

'nCombineMode d�signe le mode utilis� pour la Combinaison
'Tu peux utiliser une des constantes suivante :

Public Enum CombineMode
    RGN_AND = 1  ' Cr�� l'intersection des deux
                 'r�gions
    RGN_COPY = 5 ' Copie la R�gion1
    RGN_DIFF = 4 ' Combine les parties de R�gion1
                 'qui ne font pas partie de r�gion2
    RGN_OR = 2   ' Cr�� l'union des deux r�gions
    RGN_XOR = 3  ' Cr�� l'union des deux r�gions �
                 'laquelle on enleve l'intersection
                 'des dex r�gions
End Enum



'//////////////////////////////////////////////////////////////
'//                  APPLIQUER DES REGIONS                   //
'//////////////////////////////////////////////////////////////

'Pour appliquer une r�gion � une fen�tre, on utilise la
'fonction suivante :

Declare Function SetWindowRgn Lib "user32" ( _
ByVal hWnd As Long, _
ByVal hRgn As Long, _
ByVal bRedraw As Boolean _
) As Long

'hWnd indique le Handle de la fen�tre � laquelle on veut
'appliquer la r�gion.

'hRgn indique le Handle de la r�gion � appliquer.

'bRedraw indique s'il faut redessiner la fen�tre.
         'Mettre True si la fen�tre est visible
         'On peut mettre False si elle est cach�e.

'Note : On peut utiliser cette fonction avec le handle d'un
'contr�le au lieu de celui d'une Fen�tre



'//////////////////////////////////////////////////////////////
'//                  SUPPRIMER DES REGIONS                   //
'//////////////////////////////////////////////////////////////

'Une fois que l'on a plus besoin d'une r�gion, il faut la
'supprimer pour lib�rer de la m�moire.

'Pour cela, on peut utiliser la fonction :

Declare Function DeleteObject Lib "gdi32" ( _
ByVal hObject As Long _
) As Long

'hObject d�signe le Handle de la r�gion � supprimer.

'ATTENTION  : NE PAS SUPPRIMER UNE REGION QUI EST APPLIQUEE
'A UNE FENETRE. CELA AURAIT POUR EFFET DE LAISSER LA FENETRE
'IMPRIMEE SUR LE BUREAU (CA FAIT PAS BEAU)





'Voil�, maintenant si vous arrivez � faire des feuilles jolie
'N'h�sitez pas � m'envoyer une copie du code source �

'Detoux@club-internet.fr
