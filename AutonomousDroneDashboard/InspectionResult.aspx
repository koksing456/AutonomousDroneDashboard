<%@ Page Language="C#" Title="Dashboard" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InspectionResult.aspx.cs" Inherits="AutonomousDroneDashboard.InspectionResult" %>
<%@ MasterType VirtualPath="~/Site1.Master" %> 

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
         <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet"/>

    <link rel="stylesheet" href="fonts/icomoon/style.css" />

    <link rel="stylesheet" href="css/owl.carousel.min.css" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    
    <!-- Style -->
    <link rel="stylesheet" href="css/style.css"/>

    <style>
        .listbox1{
/*            width:500px;
            height:500px;*/
            display:flex;
        }

        .listbox1 option{
            display:flex;
        }

        .wrapper{
            max-height:120px;
            border: 1px solid #ddd;
            display:flex;
            overflow-x:auto;
            margin-left:100px;
        }

        .wrapper::-webkit-scrollbar{
            width:0;
        }

        .wrapper .item{
            min-width: 110px;
            height:110px;
            line-height:110px;
            text-align: center;
            background-color:#ddd;
            margin-right:2px;
        }

        .box {
  display:block;
  background-color: #444;
  color: #fff;
  border-radius: 5px;
  padding: 20px;
  font-size: 150%;
}

        .table  
        {  
            border: 1px solid #ccc;  
            border-collapse: collapse;  
            width: 200px;  
        }  
        .table th  
        {  
            background-color: #F7F7F7;  
            color: #333;  
            font-weight: bold;  
        }  
        .table th, .table td  
        {  
            padding: 5px;  
            border: 1px solid #ccc;  
        } 

        .projectItem{
            margin-left:850px;
        }

        .addProjectBtn{
            margin-left:2000px;
            width:100%;
            height:54px;
            padding-left:30px;
            padding-right:30px;
            cursor:pointer;
            color:#fff;
            background-color:#6c63ff;
            border-color:#6c63ff;
            font-weight:400;
            text-align:center;
            vertical-align:middle;
            user-select:none;
            border:1px solid;
            border-radius:0.25rem;
            overflow:visible;

        }

        .label1{
              position: fixed; /* or absolute */
  top: 50%;
  left: 43%;
        }
    </style>

    </asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
         <div class="content">

                    <div class="col-md-6 contents">
                        <div class="row justify-content-center">
                                <%--<asp:Button ID="Button1" runat="server" Text="Add Project" CssClass="addProjectBtn" />--%>

                            <div class="projectItem">
                            <asp:DataList ID="DataList1" runat="server" RepeatColumns="2" CellSpacing="3" RepeatLayout="Table">
                                <ItemTemplate>
                                    <table class="table">
                                        <tr>
                                            <td colspan="2">
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/img/river5.jpg" />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                                
                          <%--       <asp:DataList ID="DataList1" runat="server">  
            <ItemTemplate>  
                <table cellpadding="2" cellspacing="0" border="1" style="width: 300px; height: 100px;   
                border: dashed 2px #04AFEF; background-color: #FFFFFF">  
                    <tr>  
                        <td>  
                            <b>ID: </b><span class="city"><%# Eval("ID") %></span><br />  
                            <b>Name: </b><span class="postal"><%# Eval("Name") %></span><br />  
                            <b>Email: </b><span class="country"><%# Eval("Email")%></span><br />  
                        </td>  
                    </tr>  
                </table>  
            </ItemTemplate>  
        </asp:DataList>  --%>
                                </div>
                            
                        </div>
            </div>
        </div>
    <asp:Label ID="Label1" runat="server" Text="" CssClass="label1"></asp:Label>
</asp:Content>
