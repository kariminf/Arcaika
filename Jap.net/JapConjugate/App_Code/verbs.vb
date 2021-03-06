Imports Microsoft.VisualBasic
Public Class verbs
    '==========================================================
    'Links
    'http://www.ogurano.net/jpar/
    'http://en.wikipedia.org/wiki/Japanese_verb_conjugations_and_adjective_declensions
    'http://www.guidetojapanese.org/learn/grammar#contents
    'http://en.wikibooks.org/wiki/Japanese/Verb_conjugation_table
    'http://wiki.verbix.com/Languages/Japanese?verb=%E8%81%9E%E3%81%8F&rverb=kiku
    'http://www.coscom.co.jp/japaneseverb/japaneseverb02-jpr.html
    '==========================================================

    'conjugate forms
    Public ReadOnly _TeForm As Integer = 0 'no polite form
    Public ReadOnly _Present As Integer = 1 'る、　ます
    Public ReadOnly _Past As Integer = 2 'た、ました
    Public ReadOnly _Provision As Integer = 3 'ば
    Public ReadOnly _Condition As Integer = 4 'ta＋ら
    Public ReadOnly _Raison As Integer = 16 'ta＋から
    Public ReadOnly _Imperative As Integer = 5 'え、ろ
    Public ReadOnly _Lets As Integer = 6 'おう、ましょう

    Public ReadOnly _Causative As Integer = 13 'a＋せる a＋させる

    Public ReadOnly _PresentContinuous As Integer = 7 'te + いる
    Public ReadOnly _PastContinuous As Integer = 8 'te + いる
    Public ReadOnly _Desire As Integer = 9 'i + たい
    Public ReadOnly _WhileDoing As Integer = 10 'ながら
    Public ReadOnly _WayOfDoing As Integer = 11 'かた・方
    Public ReadOnly _Passive As Integer = 12 'a＋れる a＋られる

    Public ReadOnly _CausativePassive As Integer = 14 'a＋せられる a＋させられる
    Public ReadOnly _Potential As Integer = 15 'e＋る e＋られる


    'group--------------------------------------
    Private ReadOnly _IcchiDan As Integer = 1
    Private ReadOnly _Irregular As Integer = 2
    Private ReadOnly _GoDan As Integer = 5
    Private ReadOnly _ZuruVerb As Integer = 47
    Private ReadOnly _KuruVerb As Integer = 48
    Private ReadOnly _SuruVerb As Integer = 68

    'verb ending forms-------------------
    Private ReadOnly _UFrm As Byte = 0
    Private ReadOnly _IFrm As Byte = 1
    Private ReadOnly _AFrm As Byte = 2
    Private ReadOnly _EFrm As Byte = 3
    Private ReadOnly _OFrm As Byte = 4
    Private ReadOnly _TeFrm As Byte = 5
    Private ReadOnly _TaFrm As Byte = 6

    Public Function Conjugate(ByVal verb As String, ByVal group As Integer, ByVal time As Integer, ByVal polite As Boolean, ByVal positive As Boolean) As String

        Dim endOfVerb As Char
        Dim verb_conjug As String = verb
        If Not VerbVerify(verb_conjug, endOfVerb) Then
            Return ""
        End If

        Select Case time
            Case _TeForm
                If positive Then
                    verb_conjug = _Forms(verb_conjug, endOfVerb, group, _TeFrm)
                Else
                    verb_conjug = _Forms(verb_conjug, endOfVerb, group, _AFrm) + "なくて"
                End If

            Case _Present
                If polite Then
                    If positive Then
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _IFrm) + "ます"
                    Else 'negative
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _IFrm) + "ません"
                    End If
                Else 'not polite ==> inFrmal
                    If positive Then
                        verb_conjug = verb
                    Else 'negative
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _AFrm) + "ない"
                    End If
                End If

            Case _Past
                If polite Then
                    If positive Then
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _IFrm) + "ました"
                    Else 'negative
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _IFrm) + "ませんでした"
                    End If
                Else 'not polite ==> inFrmal
                    If positive Then
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _TaFrm)
                    Else 'negative
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _AFrm) + "なかった"
                    End If
                End If

            Case _Provision
                If polite Then
                    If positive Then
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _IFrm) + "ませば"
                    Else
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _IFrm) + "ませんならば"
                    End If
                Else
                    If positive Then
                        Select Case group
                            Case _IcchiDan
                                verb_conjug += "れば"
                            Case _GoDan, _ZuruVerb
                                verb_conjug = _Forms(verb_conjug, endOfVerb, group, _EFrm) + "ば"
                            Case _Irregular, _KuruVerb, _SuruVerb
                                verb_conjug = _Forms(verb_conjug, endOfVerb, group, _EFrm) + "れば"
                        End Select
                    Else 'negative
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _AFrm) + "なければ"
                    End If
                End If
                
            Case _Condition
                If polite Then
                    If positive Then
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _IFrm) + "ましたら"
                    Else
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _IFrm) + "ませんでしたら"
                    End If
                Else
                    If positive Then
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _TaFrm) + "ら"
                    Else
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _AFrm) + "なかったら"
                    End If
                End If

            Case _Raison
                If polite Then
                    If positive Then
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _IFrm) + "ますから"
                    Else
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _IFrm) + "ませんから"
                    End If
                Else
                    If positive Then
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _TaFrm) + "から"
                    Else
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _AFrm) + "なかったから"
                    End If
                End If

            Case _Imperative
                If polite Then
                    If positive Then
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _TeFrm) + "下さい"
                    Else
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _AFrm) + "ないで下さい"
                    End If
                Else
                    If positive Then
                        Select Case group
                            Case _IcchiDan
                                verb_conjug += "ろ"
                            Case _GoDan, _ZuruVerb
                                verb_conjug = _Forms(verb_conjug, endOfVerb, group, _EFrm)
                            Case _Irregular
                                Select Case verb
                                    Case "くる", "来る"
                                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _EFrm) + "い"
                                    Case "する", "為る"
                                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _EFrm) + "ろ"
                                End Select

                            Case _KuruVerb
                                verb_conjug = _Forms(verb_conjug, endOfVerb, group, _EFrm) + "い"

                            Case _SuruVerb
                                verb_conjug = _Forms(verb_conjug, endOfVerb, group, _EFrm) + "ろ"
                        End Select
                    Else 'negative
                        verb_conjug = verb + "な"
                    End If
                End If

            Case _Lets
                If polite Then
                    If positive Then
                        verb_conjug = _Forms(verb_conjug, endOfVerb, group, _IFrm) + "ましょう"
                    Else
                        verb_conjug = verb + "のをやめよう"
                    End If

                Else 'not polite ==> inFrmal
                    If positive Then
                        Select Case group
                            Case _IcchiDan
                                verb_conjug += "よう"
                            Case _GoDan, _ZuruVerb
                                verb_conjug = _Forms(verb_conjug, endOfVerb, group, _OFrm) + "う"
                            Case _Irregular, _KuruVerb, _SuruVerb
                                verb_conjug = _Forms(verb_conjug, endOfVerb, group, _OFrm) + "よう"
                        End Select
                    Else
                        verb_conjug = verb + "のをやめましょう"
                    End If
                End If

        End Select

        Return verb_conjug
    End Function

    Private Function VerbVerify(ByRef verb As String, ByRef endOfVerb As Char) As Boolean
        Dim theend As String = "うくぐすつぬぶむる"
        Dim endInd As Integer

        endInd = verb.Length - 1
        'الفعل على الأقل فيه حرفان، أي أن رتبة الحرف الأخير يجب أن تكون 1 على الأقل
        If endInd > 0 Then
            'الحرف الأخير من الصيغة المعجمية للفعل
            endOfVerb = verb(endInd)
            If Not theend.Contains(endOfVerb) Then
                Return False
            End If
            verb = verb.Substring(0, endInd)
            Return True
        End If
        Return False
    End Function
    
    Private Function _Forms(ByVal verb_conjug As String, ByVal ending As Char, ByVal group As Integer, ByVal time As Byte) As String

        Select Case time
            Case _UFrm
                verb_conjug += ending

            Case _IFrm
                Select Case group
                    Case _IcchiDan
                        'يبقى كما هو
                    Case _GoDan, _ZuruVerb
                        Select Case ending
                            Case "う"
                                verb_conjug += "い"
                            Case "く"
                                verb_conjug += "き"
                            Case "ぐ"
                                verb_conjug += "ぎ"
                            Case "す"
                                verb_conjug += "し"
                            Case "つ"
                                verb_conjug += "ち"
                            Case "ぬ"
                                verb_conjug += "に"
                            Case "ぶ"
                                verb_conjug += "び"
                            Case "む"
                                verb_conjug += "み"
                            Case "る"
                                verb_conjug += "り"
                        End Select

                    Case _Irregular
                        Select Case verb_conjug
                            Case "く"
                                verb_conjug = "き"
                            Case "来", "為"
                                'يبقى كما هو
                            Case "す"
                                verb_conjug = "し"
                        End Select

                    Case _KuruVerb
                        If verb_conjug.EndsWith("く") Then
                            verb_conjug = verb_conjug.Substring(0, verb_conjug.Length - 1) + "き"
                        End If
                        '来 يبقى كما هو

                    Case _SuruVerb
                        If verb_conjug.EndsWith("す") Then
                            verb_conjug = verb_conjug.Substring(0, verb_conjug.Length - 1) + "し"
                        End If
                        '為 يبقى كما هو

                End Select

            Case _AFrm
                Select Case group
                    Case _IcchiDan
                        'يبقى كما هو
                    Case _GoDan, _ZuruVerb
                        Select Case ending
                            Case "う"
                                verb_conjug += "わ"
                            Case "く"
                                verb_conjug += "か"
                            Case "ぐ"
                                verb_conjug += "が"
                            Case "す"
                                verb_conjug += "さ"
                            Case "つ"
                                verb_conjug += "た"
                            Case "ぬ"
                                verb_conjug += "な"
                            Case "ぶ"
                                verb_conjug += "ば"
                            Case "む"
                                verb_conjug += "ま"
                            Case "る"
                                verb_conjug += "ら"
                        End Select

                    Case _Irregular
                        Select Case verb_conjug
                            Case "く"
                                verb_conjug = "こ"
                            Case "来", "為"
                                'يبقى كما هو
                            Case "す"
                                verb_conjug = "し"
                        End Select

                    Case _KuruVerb
                        If verb_conjug.EndsWith("く") Then
                            verb_conjug = verb_conjug.Substring(0, verb_conjug.Length - 1) + "こ"
                        End If
                        '来 يبقى كما هو

                    Case _SuruVerb
                        If verb_conjug.EndsWith("す") Then
                            verb_conjug = verb_conjug.Substring(0, verb_conjug.Length - 1) + "し"
                        End If
                        '為 يبقى كما هو
                End Select

            Case _EFrm
                Select Case group
                    Case _IcchiDan
                        'يبقى كما هو
                    Case _GoDan, _ZuruVerb
                        Select Case ending
                            Case "う"
                                verb_conjug += "え"
                            Case "く"
                                verb_conjug += "け"
                            Case "ぐ"
                                verb_conjug += "げ"
                            Case "す"
                                verb_conjug += "せ"
                            Case "つ"
                                verb_conjug += "て"
                            Case "ぬ"
                                verb_conjug += "ね"
                            Case "ぶ"
                                verb_conjug += "べ"
                            Case "む"
                                verb_conjug += "め"
                            Case "る"
                                verb_conjug += "れ"
                        End Select

                    Case _Irregular
                        'يبقى كما هو
                        'Select Case verb
                        'Case "くる"
                        ' verb_conjug = "く"
                        'Case "来る" Or "為る"
                        'يبقى كما هو
                        ' Case "する"
                        '  verb_conjug = "し"
                        'End Select

                    Case _KuruVerb
                        'If verb_conjug.EndsWith("く") Then
                        'verb_conjug = verb_conjug.Substring(0, verb_conjug.Length - 1) + "こ"
                        'End If
                        '来 يبقى كما هو

                    Case _SuruVerb
                        'If verb_conjug.EndsWith("す") Then
                        'verb_conjug = verb_conjug.Substring(0, verb_conjug.Length - 1) + "し"
                        'End If
                        '為 يبقى كما هو
                End Select

            Case _OFrm
                Select Case group
                    Case _IcchiDan
                        'يبقى كما هو
                    Case _GoDan, _ZuruVerb
                        Select Case ending
                            Case "う"
                                verb_conjug += "お"
                            Case "く"
                                verb_conjug += "こ"
                            Case "ぐ"
                                verb_conjug += "ご"
                            Case "す"
                                verb_conjug += "そ"
                            Case "つ"
                                verb_conjug += "と"
                            Case "ぬ"
                                verb_conjug += "の"
                            Case "ぶ"
                                verb_conjug += "ぼ"
                            Case "む"
                                verb_conjug += "も"
                            Case "る"
                                verb_conjug += "ろ"
                        End Select

                    Case _Irregular
                        Select Case verb_conjug
                            Case "く"
                                verb_conjug = "こ"
                            Case "来", "為"
                                'يبقى كما هو
                            Case "す"
                                verb_conjug = "し"
                        End Select

                    Case _KuruVerb
                        If verb_conjug.EndsWith("く") Then
                            verb_conjug = verb_conjug.Substring(0, verb_conjug.Length - 1) + "こ"
                        End If
                        '来 يبقى كما هو

                    Case _SuruVerb
                        If verb_conjug.EndsWith("す") Then
                            verb_conjug = verb_conjug.Substring(0, verb_conjug.Length - 1) + "し"
                        End If
                        '為 يبقى كما هو
                End Select

            Case _TeFrm
                Select Case group
                    Case _IcchiDan
                        verb_conjug += "て"

                    Case _GoDan
                        Select Case ending
                            Case "う"
                                If Dou_KouVerb(verb_conjug) Then
                                    verb_conjug += "うて"
                                Else
                                    verb_conjug += "って"
                                End If

                            Case "く"
                                If IkuVerb(verb_conjug) Then
                                    verb_conjug += "って"
                                Else
                                    verb_conjug += "いて"
                                End If
                            Case "ぐ"
                                verb_conjug += "いで"
                            Case "す"
                                verb_conjug += "して"
                            Case "つ"
                                verb_conjug += "って"
                            Case "ぬ"
                                verb_conjug += "んで"
                            Case "ぶ"
                                verb_conjug += "んで"
                            Case "む"
                                verb_conjug += "んで"
                            Case "る"
                                verb_conjug += "って"
                        End Select

                    Case _ZuruVerb
                        verb_conjug += "って"

                    Case _Irregular
                        Select Case verb_conjug
                            Case "く"
                                verb_conjug = "くて"
                            Case "来", "為"
                                verb_conjug += "て"
                            Case "す"
                                verb_conjug = "して"
                        End Select

                    Case _KuruVerb
                        verb_conjug += "て"

                    Case _SuruVerb
                        If verb_conjug.EndsWith("す") Then
                            verb_conjug = verb_conjug.Substring(0, verb_conjug.Length - 1) + "し"
                        End If
                        verb_conjug += "て"
                End Select

            Case _TaFrm
                Select Case group
                    Case _IcchiDan
                        verb_conjug += "た"

                    Case _GoDan
                        Select Case ending
                            Case "う"
                                If Dou_KouVerb(verb_conjug) Then
                                    verb_conjug += "うた"
                                Else
                                    verb_conjug += "った"
                                End If

                            Case "く"
                                If IkuVerb(verb_conjug) Then
                                    verb_conjug += "った"
                                Else
                                    verb_conjug += "いた"
                                End If
                            Case "ぐ"
                                verb_conjug += "いだ"
                            Case "す"
                                verb_conjug += "した"
                            Case "つ"
                                verb_conjug += "った"
                            Case "ぬ"
                                verb_conjug += "んだ"
                            Case "ぶ"
                                verb_conjug += "んだ"
                            Case "む"
                                verb_conjug += "んだ"
                            Case "る"
                                verb_conjug += "った"
                        End Select

                    Case _ZuruVerb
                        verb_conjug += "った"

                    Case _Irregular
                        Select Case verb_conjug
                            Case "く"
                                verb_conjug = "くた"
                            Case "来", "為"
                                verb_conjug += "た"
                            Case "す"
                                verb_conjug = "した"
                        End Select

                    Case _KuruVerb
                        verb_conjug += "た"

                    Case _SuruVerb
                        If verb_conjug.EndsWith("す") Then
                            verb_conjug = verb_conjug.Substring(0, verb_conjug.Length - 1) + "し"
                        End If
                        verb_conjug += "た"
                End Select
            Case Else
                verb_conjug = ""
        End Select

        Return verb_conjug
    End Function
    Private Function IkuVerb(ByRef verb_conjug As String) As Boolean
        'Dim verb As String = verb_conjug + ending
        If verb_conjug.EndsWith("い") Or verb_conjug.EndsWith("行") Then
            Return True
        ElseIf verb_conjug.EndsWith("ゆ") Then
            verb_conjug = verb_conjug.Substring(0, verb_conjug.Length - 1) + "い"
            Return True
        End If

        Return False
    End Function
    Private Function Dou_KouVerb(ByVal verb_conjug As String) As Boolean
        Dim verbPoss As String = "をと,を問,をこ,を請,を乞"
        Dim leng As Integer = verb_conjug.Length

        If leng > 1 Then
            verb_conjug = verb_conjug.Substring(leng - 2, 2)
        End If
        If verbPoss.Contains(verb_conjug) Then
            Return True
        End If

        Return False
    End Function
End Class
