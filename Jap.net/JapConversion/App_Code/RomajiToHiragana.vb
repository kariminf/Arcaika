Imports Microsoft.VisualBasic
'*********************************************************************************
'http://www.ogurano.net
'*********************************************************************************
'تصميم: عبد الكريم
'*********************************************************************************
'النسخة الأولى
'*********************************************************************************
'هذه الكلاس تستعمل للتحويل من الروماجي إلى الهيراغانا
'هناك عدة فرضيات هنا
'h ماعدا عندما يأتي وراء c=k
'tsu =つ , tsa=つぁ ,....etc
'd, ch, sh ما عدا في حالةu عندما يأتي حرف ساكن قبل حرف ساكن فإننا نضيف له حرف
'l = r
'*********************************************************************************
Public Class RomajiToHiragana
    Private remain As String = ""
    Public Function convert(ByVal entry As String) As String
        Dim stat, pointer, max As Integer
        Dim res As String
        Dim consonant As String = "bcdfghjklmprstvwz"
        Dim vowel As String = "aeuio"
        Dim doloop As Boolean = True

        res = ""
        stat = 0
        pointer = 0
        max = entry.Length - 1
        entry = entry.ToLower

        While doloop
            Select Case stat
                Case 0
                    If vowel.Contains(entry(pointer)) Then
                        remain = entry(pointer)
                        pointer = pointer + 1
                        stat = 3
                    ElseIf entry(pointer) = "n" Then
                        remain = entry(pointer)
                        pointer = pointer + 1
                        stat = 2
                    ElseIf consonant.Contains(entry(pointer)) Then
                        remain = entry(pointer)
                        pointer = pointer + 1
                        stat = 1
                    ElseIf entry(pointer) = "y" Then
                        remain = entry(pointer)
                        pointer = pointer + 1
                        stat = 10
                    Else
                        stat = 8
                    End If

                Case 1
                    If pointer > max Then
                        'doloop = False
                        If remain = "d" Then
                            remain = "do"
                        ElseIf remain = "sh" Or remain = "ch" Then
                            remain = remain + "i"
                        Else
                            remain = remain + "u"
                        End If

                        stat = 4
                    Else
                        If vowel.Contains(entry(pointer)) Then
                            remain = remain + entry(pointer)
                            pointer = pointer + 1
                            stat = 4
                        ElseIf entry(pointer) = "y" Then
                            'remain = remain + entry(pointer)
                            pointer = pointer + 1
                            stat = 5
                        ElseIf consonant.Contains(entry(pointer)) Then
                            'remain = entry(pointer)
                            'pointer = pointer + 1
                            stat = 9
                        Else
                            remain = remain + "u"
                            stat = 4
                        End If
                    End If
                    
                Case 2
                    If pointer > max Then
                        doloop = False
                        res = res + "ん"
                    Else
                        If (entry(pointer) = "n") Or (consonant.Contains(entry(pointer))) Then
                            'pointer = pointer + 1
                            stat = 6
                        ElseIf vowel.Contains(entry(pointer)) Then
                            remain = remain + entry(pointer)
                            pointer = pointer + 1
                            stat = 4
                        ElseIf entry(pointer) = "y" Then
                            'remain = remain + entry(pointer)
                            pointer = pointer + 1
                            stat = 5
                        Else
                            stat = 0
                        End If
                    End If

                Case 3
                    res = res + give_vowel()
                    stat = 0
                    If pointer > max Then
                        doloop = False
                    End If

                Case 4
                    res = res + give_table0()
                    stat = 0
                    If pointer > max Then
                        doloop = False
                    End If

                Case 5
                    'remain = remain.Substring(0, 1) + "i"
                    If remain = "ts" Then
                        res = res + "つ"
                    Else
                        remain = remain + "i"
                        res = res + give_table0()
                    End If

                    If pointer > max Then
                        doloop = False
                    Else
                        If vowel.Contains(entry(pointer)) Then
                            remain = "y"
                            stat = 7
                        Else
                            stat = 0
                        End If
                    End If

                Case 6
                        res = res + "ん"
                        stat = 0
                        If pointer > max Then
                            doloop = False
                        End If

                Case 7
                    remain = "y" + entry(pointer)
                    res = res + give_y()
                    pointer = pointer + 1
                    stat = 0
                    If pointer > max Then
                        doloop = False
                    End If

                Case 8
                    pointer = pointer + 1
                    stat = 0
                    If pointer > max Then
                        doloop = False
                    End If

                Case 9
                    If entry(pointer) = remain(0) Then
                        res = res + "っ"
                        pointer = pointer + 1
                    ElseIf remain = "c" And entry(pointer) = "h" Then
                        remain = "ch"
                        pointer = pointer + 1
                    ElseIf remain = "s" And entry(pointer) = "h" Then
                        remain = "sh"
                        pointer = pointer + 1
                    ElseIf remain = "t" And entry(pointer) = "s" Then
                        remain = "ts"
                        pointer = pointer + 1
                    ElseIf remain = "ts" Then
                        remain = entry(pointer)
                        res = res + "つ"
                        pointer = pointer + 1
                    Else
                        If remain = "d" Then
                            remain = "do"
                        ElseIf remain = "sh" Or remain = "ch" Then
                            remain = remain + "i"
                        Else
                            remain = remain + "u"
                        End If
                        res = res + give_table0()
                        remain = entry(pointer)
                        pointer = pointer + 1
                    End If
                    If remain(0) = "y" Then
                        stat = 10
                    Else
                        stat = 1
                    End If

                Case 10
                    If pointer > max Then
                        'doloop = False
                        remain = remain + "u"
                        stat = 4
                    Else
                        If vowel.Contains(entry(pointer)) Then
                            remain = remain + entry(pointer)
                            pointer = pointer + 1
                            stat = 4
                        ElseIf entry(pointer) = "y" Then
                            'remain = entry(pointer)
                            'pointer = pointer + 1
                            stat = 9
                        Else
                            remain = remain + "u"
                            stat = 4
                        End If
                    End If

            End Select

        End While
        Return res
    End Function
    Private Function give_vowel() As String
        
        Select Case remain
            Case "a"
                Return "あ"
            Case "e"
                Return "え"
            Case "u"
                Return "う"
            Case "i"
                Return "い"
            Case "o"
                Return "お"
        End Select
        Return ""
    End Function
    Private Function give_y() As String

        Select Case remain
            Case "ya"
                Return "ゃ"
            Case "ye"
                Return "ぇ"
            Case "yu"
                Return "ゅ"
            Case "yi"
                Return "ぃ"
            Case "yo"
                Return "ょ"
        End Select
        Return ""
    End Function

    Private Function give_table0() As String

        Select Case remain(0)
            Case "b"
                Select Case remain(1)
                    Case "a"
                        Return "ば"
                    Case "e"
                        Return "べ"
                    Case "u"
                        Return "ぶ"
                    Case "i"
                        Return "び"
                    Case "o"
                        Return "ぼ"
                End Select

            Case "c"
                Select Case remain(1)
                    Case "a"
                        Return "か"
                    Case "e"
                        Return "け"
                    Case "u"
                        Return "く"
                    Case "i"
                        Return "き"
                    Case "o"
                        Return "こ"
                    Case "h"
                        Select Case remain(2)
                            Case "a"
                                Return "ちゃ"
                            Case "e"
                                Return "ちぇ"
                            Case "u"
                                Return "ちゅ"
                            Case "i"
                                Return "ち"
                            Case "o"
                                Return "ちょ"
                        End Select
                End Select

            Case "d"
                Select Case remain(1)
                    Case "a"
                        Return "だ"
                    Case "e"
                        Return "で"
                    Case "u"
                        Return "づ"
                    Case "i"
                        Return "ぢ"
                    Case "o"
                        Return "ど"
                End Select

            Case "f"
                Select Case remain(1)
                    Case "a"
                        Return "ふぁ"
                    Case "e"
                        Return "ふぇ"
                    Case "u"
                        Return "ふ"
                    Case "i"
                        Return "ふぃ"
                    Case "o"
                        Return "ふぉ"
                End Select

            Case "g"
                Select Case remain(1)
                    Case "a"
                        Return "が"
                    Case "e"
                        Return "げ"
                    Case "u"
                        Return "ぐ"
                    Case "i"
                        Return "ぎ"
                    Case "o"
                        Return "ご"
                End Select

            Case "h"
                Select Case remain(1)
                    Case "a"
                        Return "は"
                    Case "e"
                        Return "へ"
                    Case "u"
                        Return "ふ"
                    Case "i"
                        Return "ひ"
                    Case "o"
                        Return "ほ"
                End Select

            Case "j"
                Select Case remain(1)
                    Case "a"
                        Return "じゃ"
                    Case "e"
                        Return "じぇ"
                    Case "u"
                        Return "じゅ"
                    Case "i"
                        Return "じ"
                    Case "o"
                        Return "じょ"
                End Select

            Case "k"
                Select Case remain(1)
                    Case "a"
                        Return "か"
                    Case "e"
                        Return "け"
                    Case "u"
                        Return "く"
                    Case "i"
                        Return "き"
                    Case "o"
                        Return "こ"
                End Select

            Case "l"
                Select Case remain(1)
                    Case "a"
                        Return "ら"
                    Case "e"
                        Return "れ"
                    Case "u"
                        Return "る"
                    Case "i"
                        Return "り"
                    Case "o"
                        Return "ろ"
                End Select

            Case "m"
                Select Case remain(1)
                    Case "a"
                        Return "ま"
                    Case "e"
                        Return "め"
                    Case "u"
                        Return "む"
                    Case "i"
                        Return "み"
                    Case "o"
                        Return "も"
                End Select

            Case "n"
                Select Case remain(1)
                    Case "a"
                        Return "な"
                    Case "e"
                        Return "ね"
                    Case "u"
                        Return "ぬ"
                    Case "i"
                        Return "に"
                    Case "o"
                        Return "の"
                End Select

            Case "p"
                Select Case remain(1)
                    Case "a"
                        Return "ぱ"
                    Case "e"
                        Return "ぺ"
                    Case "u"
                        Return "ぷ"
                    Case "i"
                        Return "ぴ"
                    Case "o"
                        Return "ぽ"
                End Select

            Case "r"
                Select Case remain(1)
                    Case "a"
                        Return "ら"
                    Case "e"
                        Return "れ"
                    Case "u"
                        Return "る"
                    Case "i"
                        Return "り"
                    Case "o"
                        Return "ろ"
                End Select

            Case "s"
                Select Case remain(1)
                    Case "a"
                        Return "さ"
                    Case "e"
                        Return "せ"
                    Case "u"
                        Return "す"
                    Case "i"
                        Return "し"
                    Case "o"
                        Return "そ"
                    Case "h"
                        Select Case remain(2)
                            Case "a"
                                Return "しゃ"
                            Case "e"
                                Return "し"
                            Case "u"
                                Return "しゅ"
                            Case "i"
                                Return "し"
                            Case "o"
                                Return "しょ"
                        End Select
                End Select

            Case "t"
                Select Case remain(1)
                    Case "a"
                        Return "た"
                    Case "e"
                        Return "て"
                    Case "u"
                        Return "つ"
                    Case "i"
                        Return "ち"
                    Case "o"
                        Return "と"
                    Case "s"
                        Select Case remain(2)
                            Case "a"
                                Return "つぁ"
                            Case "e"
                                Return "つぇ"
                            Case "u"
                                Return "つ"
                            Case "i"
                                Return "つぃ"
                            Case "o"
                                Return "つぉ"
                        End Select
                End Select

            Case "v"
                Select Case remain(1)
                    Case "a"
                        Return "ゔぁ"
                    Case "e"
                        Return "ゔぉ"
                    Case "u"
                        Return "ゔう"
                    Case "i"
                        Return "ゔぃ"
                    Case "o"
                        Return "ゔぉ"
                End Select

            Case "w"
                Select Case remain(1)
                    Case "a"
                        Return "わ"
                    Case "e"
                        Return "うぇ"
                    Case "u"
                        Return "う"
                    Case "i"
                        Return "うぃ"
                    Case "o"
                        Return "を"
                End Select

            Case "y"
                Select Case remain(1)
                    Case "a"
                        Return "や"
                    Case "e"
                        Return "いぇ"
                    Case "u"
                        Return "ゆ"
                    Case "i"
                        Return "い"
                    Case "o"
                        Return "よ"
                End Select

            Case "z"
                Select Case remain(1)
                    Case "a"
                        Return "ざ"
                    Case "e"
                        Return "ぜ"
                    Case "u"
                        Return "ず"
                    Case "i"
                        Return "じ"
                    Case "o"
                        Return "ぞ"
                End Select

        End Select
        Return ""
    End Function
End Class
