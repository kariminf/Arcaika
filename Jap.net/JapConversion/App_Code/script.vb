Imports Microsoft.VisualBasic
'*********************************************************************************
'http://www.ogurano.net
'*********************************************************************************
'تصميم: عبد الكريم
'*********************************************************************************
'النسخة الثانية: جديد النسخة هو استعمال جداول اليونيكود
'*********************************************************************************
'هذه الكلاس تستعمل لتمييز أنواع السكريبتات (أنواع الكتابة) بين
'الروماجي والعربية والهيراغانا والكاتاكانا والكانجي
'تقوم أيضا بالتحويل من الهيراغانا إلى الكاتاكانا والعكس
'*********************************************************************************
Public Class script

    Public ReadOnly _Arabic As Integer = 2
    Public ReadOnly _Romaji As Integer = 3
    Public ReadOnly _Katakana As Integer = 5
    Public ReadOnly _Hiragana As Integer = 7
    Public ReadOnly _Kanji As Integer = 11
    Public ReadOnly _OTHERS As Integer = 13

    'هذه الدالة تعطينا نوع الحروف أو الرموز التي تتكون منها الكلمة المعطاة
    'بالعربية تعطينا الرقم 2
    'بالروماجي تعطينا الرقم 3
    'بالكاتاكانا تعطينا الرقم 5
    'بالهيراغانا تعطينا الرقم 7
    'بالكانجي تعطينا الرقم 11
    'إذا كانت غير ذلك تعطينا الرقم 13
    'أما إن كانت مركبة من عدة أنواع فسنحصل على حاصل ضرب أرقام هذه الأنواع
    'ولأن تلك الأرقام أولية يمكننا معرفة الكلمة مما تتكون
    Public Function giveScriptType(ByVal entry As String) As Integer
        Dim i, max, result, unicode As Integer
        Dim notfoundyet(6) As Boolean
        Dim notpass As Boolean = True

        For i = 0 To 5
            notfoundyet(i) = True
        Next
        result = 1
        max = entry.Length - 1

        For i = 0 To max
            'If (Encoding.Unicode.GetByteCount(entry(i)) <> 2) Then
            'Return -1
            'End If
            Dim A As Byte() = System.Text.Encoding.GetEncoding("Unicode").GetBytes(entry(i))
            unicode = BitConverter.ToUInt16(A, 0)

            'arabic
            If (unicode > &H620 And unicode < &H653) Then
                notpass = False
                If notfoundyet(0) Then
                    notfoundyet(0) = False
                    result = result * _Arabic
                End If
            End If

            'romaji
            If notpass And ((unicode > &H40 And unicode < &H5B) Or (unicode > &H60 And unicode < &H7B)) Then
                notpass = False
                If notfoundyet(1) Then
                    notfoundyet(1) = False
                    result = result * _Romaji
                End If
            End If

            'katakana
            If notpass And (unicode > &H30A0 And unicode < &H30F5) Then
                notpass = False
                If notfoundyet(2) Then
                    notfoundyet(2) = False
                    result = result * _Katakana
                End If
            End If

            'hiragana
            If notpass And (unicode > &H3040 And unicode < &H3095) Then
                notpass = False
                If notfoundyet(3) Then
                    notfoundyet(3) = False
                    result = result * _Hiragana
                End If
            End If

            'kanji
            If notpass And (unicode >= &H4E00 And unicode < &H9FA6) Then
                notpass = False
                If notfoundyet(4) Then
                    notfoundyet(4) = False
                    result = result * _Kanji
                End If
            End If

            'others
            If notfoundyet(5) And notpass Then
                notfoundyet(5) = False
                result = result * _OTHERS
            End If

            notpass = True
        Next


        Return result
    End Function

    'هذه الدالة للتأكد من أن كل حروف الكلمة هي عبارة عن كاتاكانا
    Public Function isKatakana(ByVal entry As String) As Boolean
        Dim i, max As Integer

        i = 0
        max = entry.Length

        If max = 0 Then
            Return False
        End If

        While (i < max)
            If charKatakana(entry(i)) = -1 Then
                Return False
            End If
            i = i + 1
        End While

        Return True

    End Function

    'هذه الدالة للتأكد من أنه يوجد حرف على الأقل من حروف الكاتاكانا
    Public Function hasKatakana(ByVal entry As String) As Boolean
        Dim i, max As Integer

        i = 0
        max = entry.Length

        While (i < max)
            If charKatakana(entry(i)) <> -1 Then
                Return True
            End If
            i = i + 1
        End While

        Return False

    End Function

    'هذه الدالة للتأكد من أن كل حروف الكلمة هي عبارة عن هيراغانا
    Public Function isHiragana(ByVal entry As String) As Boolean
        Dim i, max As Integer

        i = 0
        max = entry.Length

        If max = 0 Then
            Return False
        End If

        While (i < max)
            If charHiragana(entry(i)) = -1 Then
                Return False
            End If
            i = i + 1
        End While

        Return True

    End Function

    'هذه الدالة للتأكد من أنه يوجد حرف على الأقل من حروف هيراغانا
    Public Function hasHiragana(ByVal entry As String) As Boolean
        Dim i, max As Integer

        i = 0
        max = entry.Length

        While (i < max)
            If charHiragana(entry(i)) <> -1 Then
                Return True
            End If
            i = i + 1
        End While

        Return False

    End Function

    'هذه الدالة للتأكد من أن كل حروف الكلمة هي عبارة عن حروف عربية
    Public Function isArabic(ByVal entry As String) As Boolean
        Dim i, max As Integer

        i = 0
        max = entry.Length

        If max = 0 Then
            Return False
        End If

        While (i < max)
            If charArabic(entry(i)) = -1 Then
                Return False
            End If
            i = i + 1
        End While

        Return True

    End Function

    'هذه الدالة للتأكد من أنه يوجد حرف على الأقل من حروف العربية
    Public Function hasArabic(ByVal entry As String) As Boolean
        Dim i, max As Integer

        i = 0
        max = entry.Length

        While (i < max)
            If charArabic(entry(i)) <> -1 Then
                Return True
            End If
            i = i + 1
        End While

        Return False

    End Function

    'هذه الدالة للتأكد من أن كل حروف الكلمة هي عبارة عن حروف لاتينية
    Public Function isRomaji(ByVal entry As String) As Boolean
        Dim i, max As Integer

        i = 0
        max = entry.Length

        If max = 0 Then
            Return False
        End If

        While (i < max)
            If charRomaji(entry(i)) = -1 Then
                Return False
            End If
            i = i + 1
        End While

        Return True

    End Function

    'هذه الدالة للتأكد من أنه يوجد حرف على الأقل من حروف اللاتينية
    Public Function hasRomaji(ByVal entry As String) As Boolean
        Dim i, max As Integer

        i = 0
        max = entry.Length

        While (i < max)
            If charRomaji(entry(i)) <> -1 Then
                Return True
            End If
            i = i + 1
        End While

        Return False

    End Function

    'هذه الدالة للتأكد من أن كل حروف الكلمة هي عبارة عن كانجي
    Public Function isKanji(ByVal entry As String) As Boolean
        Dim i, max As Integer

        i = 0
        max = entry.Length

        If max = 0 Then
            Return False
        End If

        While (i < max)
            If charKanji(entry(i)) = -1 Then
                Return False
            End If
            i = i + 1
        End While

        Return True

    End Function

    'هذه الدالة للتأكد من أنه يوجد حرف على الأقل من حروف الكانجي
    Public Function hasKanji(ByVal entry As String) As Boolean
        Dim i, max As Integer

        i = 0
        max = entry.Length

        While (i < max)
            If charKanji(entry(i)) <> -1 Then
                Return True
            End If
            i = i + 1
        End While

        Return False

    End Function

    'التحويل من الهيراغانا إلى الكاتاكانا أو العكس
    'choice=true: from hiragana to katakana
    'choice=false: from katakana to hiragana
    Public Function transkana(ByVal entry As String, ByVal choice As Boolean) As String
        Dim i, unicode, upto As Integer
        Dim c As Char()
        Dim A As Byte()
        Dim str, str2 As String

        str = entry
        str2 = ""
        upto = entry.Length - 1

        'هنا نبحث عن الحروف المكونة للكلمة بدون إعادة الحرف أكثر من مرة
        For i = 0 To upto
            If str(i) <> "$" Then
                str2 = str2 + str(i)
                str = str.Replace(entry(i), "$")
            End If
        Next

        upto = str2.Length - 1

        For i = 0 To upto
            If choice Then
                unicode = charHiragana(str2(i))
                If unicode <> -1 Then
                    unicode = unicode + &H60
                End If
            Else
                unicode = charKatakana(str2(i))
                If unicode <> -1 Then
                    unicode = unicode - &H60
                End If
            End If

            'إن كنا نريد التحويل من الهيراغانا (الكاتاكانا) ولم يكن الحرف هيراغانا (كاتاكانا)فلا
            ' نقوم بالتحويل، أي أن الحروف والرموز غير المعنية بالتحويل تبقى كما هي
            If unicode <> -1 Then
                A = BitConverter.GetBytes(unicode)
                c = System.Text.Encoding.GetEncoding("Unicode").GetChars(A)
                entry = entry.Replace(str2(i), c(0))
            End If

        Next

        Return entry
    End Function
   
    Private Function charHiragana(ByVal character As Char) As Integer
        Dim unicode As Integer

        'If (Encoding.Unicode.GetByteCount(character) <> 2) Then
        'Return -1
        'End If
        Dim A As Byte() = System.Text.Encoding.GetEncoding("Unicode").GetBytes(character)
        unicode = BitConverter.ToUInt16(A, 0)
        If (unicode > &H3040 And unicode < &H3095) Then
            Return unicode
        End If
        Return -1
    End Function
    Private Function charKatakana(ByVal character As Char) As Integer
        Dim unicode As Integer

        'If (Encoding.Unicode.GetByteCount(character) <> 2) Then
        'Return -1
        'End If
        Dim A As Byte() = System.Text.Encoding.GetEncoding("Unicode").GetBytes(character)
        unicode = BitConverter.ToUInt16(A, 0)
        If (unicode > &H30A0 And unicode < &H30F5) Then
            Return unicode
        End If
        Return -1
    End Function
    Private Function charArabic(ByVal character As Char) As Integer
        Dim unicode As Integer

        'If (Encoding.Unicode.GetByteCount(character) <> 2) Then
        'Return -1
        'End If
        Dim A As Byte() = System.Text.Encoding.GetEncoding("Unicode").GetBytes(character)
        unicode = BitConverter.ToUInt16(A, 0)
        If (unicode > &H620 And unicode < &H653) Then
            Return unicode
        End If
        Return -1
    End Function
    Private Function charRomaji(ByVal character As Char) As Integer
        Dim unicode As Integer

        'If (Encoding.Unicode.GetByteCount(character) <> 2) Then
        'Return -1
        'End If
        Dim A As Byte() = System.Text.Encoding.GetEncoding("Unicode").GetBytes(character)
        unicode = BitConverter.ToUInt16(A, 0)
        If ((unicode > &H40 And unicode < &H5B) Or (unicode > &H60 And unicode < &H7B)) Then
            Return unicode
        End If
        Return -1
    End Function
    Private Function charKanji(ByVal character As Char) As Integer
        Dim unicode As Integer

        'If (Encoding.Unicode.GetByteCount(character) <> 2) Then
        'Return -1
        'End If
        Dim A As Byte() = System.Text.Encoding.GetEncoding("Unicode").GetBytes(character)
        unicode = BitConverter.ToUInt16(A, 0)
        If (unicode >= &H4E00 And unicode < &H9FA6) Then
            Return unicode
        End If
        Return -1
    End Function
End Class
