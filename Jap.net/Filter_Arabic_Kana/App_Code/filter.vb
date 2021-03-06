Imports Microsoft.VisualBasic
'Class filter: Its function is to detect if a given textbox has
'an arabic/kana alphabet 
' For: http://www.ogurano.net
Public Class filter
    Dim isArabicSearch, isSearchKana As Boolean
    Dim text_box As TextBox
    Dim arabicchar As Char() = {"ا", "ب", "ت", "ث", "ج", "ح", "خ", "د", "ذ", "ر", _
"ز", "س", "ش", "ص", "ض", "ط", "ظ", "ع", "غ", "ف", "ق", "ك", "ل", "م", "ن", "ه", _
 "و", "ي", "أ", "إ", "ؤ", "ئ", "ء", "ة", "ى"}
    Dim kana As Char() = {"あ", "い", "う", "え", "お", "か", "き", "く", "け", _
"こ", "さ", "し", "す", "せ", "そ", "た", "ち", "つ", "て", "と", "な", "に", "ぬ", _
"ね", "の", "は", "ひ", "ふ", "へ", "ほ", "ま", "み", "む", "め", "も", "や", "ゆ", _
"よ", "ら", "り", "る", "れ", "ろ", "わ", "を", "ん", "が", "ぎ", "ぐ", "げ", "ご", _
"ざ", "じ", "ず", "ぜ", "ぞ", "だ", "ぢ", "づ", "で", "ど", "ば", "び", "ぶ", "べ", _
"ぼ", "ぱ", "ぴ", "ぷ", "ぺ", "ぽ", "コ", "サ", "シ", "ぁ", "ぃ", "ぅ", "ぇ", "ぉ", _
"ゃ", "ゅ", "ょ", "っ", "ア", "イ", "ウ", "エ", "オ", "カ", "キ", "ク", "ケ", "ス", _
"セ", "ソ", "タ", "チ", "ツ", "テ", "ト", "ナ", "ニ", "ヌ", "ネ", "ノ", "ハ", "ヒ", _
"フ", "ヘ", "ホ", "マ", "ミ", "ム", "メ", "モ", "ヤ", "ユ", "ヨ", "ラ", "リ", "ル", _
"レ", "ロ", "ワ", "ヲ", "ン", "ガ", "ギ", "グ", "ゲ", "ゴ", "ザ", "ジ", "ズ", "ゼ", _
"ゾ", "ダ", "ヂ", "ヅ", "デ", "ド", "バ", "ビ", "ブ", "ベ", "ボ", "パ", "ピ", "プ", _
"ペ", "ポ", "ァ", "ィ", "ゥ", "ェ", "ォ", "ャ", "ュ", "ョ", "ッ"}

    ' here when we create an object from this class we have to indicate witch textbox is
    'concerned by this object
    Public Sub New(ByVal adr_text_box As TextBox)
        text_box = adr_text_box
        isArabicSearch = False
        isSearchKana = False
    End Sub
    'this sub is to return the two variables to false
    Public Sub initialize()
        isArabicSearch = False
        isSearchKana = False
    End Sub
    'this is the important sub in this class, it analyze the textbox and look if it has 
    'arabic variables and also look for kana
    Public Sub analyze()
        isArabicSearch = (text_box.Text.IndexOfAny(arabicchar) >= 0)
        isSearchKana = (text_box.Text.IndexOfAny(kana) >= 0)
    End Sub
    'this sub is to clean the text inside the chosen text box
    Public Sub clean_text()
        text_box.Text = ""
    End Sub
    'this function return the value of isArabicSearch
    Public Function isArabicSearch_value() As Boolean
        Return isArabicSearch
    End Function
    'this function return the value of isSearchKana
    Public Function isSearchKana_value() As Boolean
        Return isSearchKana
    End Function
End Class
