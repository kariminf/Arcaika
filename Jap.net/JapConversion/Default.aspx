<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center><asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"
            Text="������� �� �������� ��� ����������" Width="301px"></asp:Label></center><br />
        <asp:TextBox ID="ffrom" runat="server" Width="190px"></asp:TextBox>
        <asp:Button ID="Button3" runat="server" Text="��� �� �������� ��� ����������" Width="204px" />
        <asp:TextBox ID="fto" runat="server" Enabled="False" Width="222px"></asp:TextBox><br />
        <hr />
        <center><asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"
            Text="����� ������ ������� (����� ��������)�" Width="337px"></asp:Label></center><br />
        <asp:Label ID="Label3" runat="server" Text="��� ����� ����� ��� ������� ������� ���������� ���������� �� ���� ���� �� ��� ������ ������� ���� �������"
            Width="569px"></asp:Label>
        <br />
        <asp:TextBox ID="tex" runat="server" Width="258px"></asp:TextBox>
        <asp:Button ID="b" runat="server" Text="��� ������ ������� �������" Width="181px" /><br />
        <hr />
        <center><asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"
            Text="������ ��� ����� ��� �������" Width="301px"></asp:Label></center><br />
        <asp:Label ID="Label1" runat="server" Text="����������" Width="55px"></asp:Label>
        <asp:TextBox ID="t1" runat="server"></asp:TextBox>
        <asp:Button ID="button" runat="server" Height="22px" Text="�� ������ ��������" Width="98px" />
        <asp:Button ID="Button4" runat="server" Text="���� ��� ��� �����" Width="116px" /><br />
        <asp:Label ID="Label2" runat="server" Text="����������" Width="55px"></asp:Label>
        <asp:TextBox ID="t2" runat="server" Width="148px" Wrap="False"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="�� ������ ��������" Width="99px" />
        <asp:Button ID="Button5" runat="server" Text="���� ��� ��� �����" Width="116px" /><br />
        <asp:Label ID="Label8" runat="server" Text="�������" Width="54px"></asp:Label>
        <asp:TextBox ID="t3" runat="server"></asp:TextBox>
        <asp:Button ID="Button6" runat="server" Text="���� ��������" Width="98px" />
        <asp:Button ID="Button7" runat="server" Text="���� ��� ��� �����" Width="117px" /><br />
        &nbsp;<asp:Label ID="Label9" runat="server" Text="��������" Width="50px"></asp:Label>
        <asp:TextBox ID="t4" runat="server"></asp:TextBox>
        <asp:Button ID="Button8" runat="server" Text="���� ���������" Width="97px" />
        <asp:Button ID="Button9" runat="server" Text="���� ��� ��� �����" Width="118px" /><br />
        <asp:Label ID="Label10" runat="server" Text="�������" Width="53px"></asp:Label>
        <asp:TextBox ID="t5" runat="server"></asp:TextBox>
        <asp:Button ID="Button10" runat="server" Text="���� ��������" Width="99px" />
        <asp:Button ID="Button11" runat="server" Text="���� ��� ��� �����" Width="117px" /><br />
        <hr />
        <center><asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="X-Large"
            ForeColor="Red" Text="������� �� ��������� ��� ���������� �� �����" Width="371px"></asp:Label></center><br />
        hiragana &lt;----&gt; katakana<br />
        <asp:CheckBox ID="what" runat="server" Text="katakana to hiragana" />
        <br />
        <asp:TextBox ID="tfrom" runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="-->" Width="70px" />
        <asp:TextBox ID="tto" runat="server"></asp:TextBox></div>
    </form>
</body>
</html>
