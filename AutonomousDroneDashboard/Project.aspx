<%@ Page Language="C#" Title="Projects" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="AutonomousDroneDashboard.Project" %>
<%@ MasterType VirtualPath="~/Site1.Master" %> 

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet" />

    <link rel="stylesheet" href="fonts/icomoon/style.css" />

    <link rel="stylesheet" href="css/owl.carousel.min.css" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />

    <!-- Style -->
    <link rel="stylesheet" href="css/style.css" />

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
            margin-left:700px;
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
    </style>

    <%--<link rel="stylesheet" href="../css/ProductStyle.css" />--%>

 </asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="content">

                    <div class="col-md-6 contents">
                        <div class="row justify-content-center">
                                <asp:Button ID="Button1" runat="server" Text="Add Project" OnClick="Button1_Click" CssClass="addProjectBtn" />

                            <div class="projectItem">
                            <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both" OnItemCommand="DataList1_ItemCommand">
                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                <ItemStyle BackColor="White" ForeColor="#003399" />
                                <ItemTemplate>
                                    <table class="table">
                                        <tr>
                                            <th>
                                                <asp:Label ID="Label2" runat="server" Text="<%# Container.DataItem %>"></asp:Label>
                                            </th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/img/sampleMap.png" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="projectBTN" runat="server" Text="Select"  />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            </asp:DataList>

                                <asp:Label ID="pName" runat="server" Text=""></asp:Label>
                                </div>
                        </div>
            </div>
        </div>

    <asp:Label ID="Label1" runat="server" Text="" CssClass="label1"></asp:Label>

        <script type="module">
            //Firebase
            // Import the functions you need from the SDKs you need
            import { initializeApp } from "https://www.gstatic.com/firebasejs/9.2.0/firebase-app.js";
            import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.2.0/firebase-analytics.js";
            // TODO: Add SDKs for Firebase products that you want to use
            // https://firebase.google.com/docs/web/setup#available-libraries

            // Your web app's Firebase configuration
            // For Firebase JS SDK v7.20.0 and later, measurementId is optional
            const firebaseConfig = {
                apiKey: "AIzaSyCC-D6wt3d2F06w3BuGM2WGd0EDVZMS_vE",
                authDomain: "drone-project-f9a08.firebaseapp.com",
                databaseURL: "https://drone-project-f9a08-default-rtdb.asia-southeast1.firebasedatabase.app",
                projectId: "drone-project-f9a08",
                storageBucket: "drone-project-f9a08.appspot.com",
                messagingSenderId: "563164922782",
                appId: "1:563164922782:web:bb2424cb956aa6dfa60c8f",
                measurementId: "G-9T34FLVDMH"
            };

            // Initialize Firebase
            const app = initializeApp(firebaseConfig);
            const analytics = getAnalytics(app);

            import { getDatabase, ref, set, child, update, remove } from "https://www.gstatic.com/firebasejs/9.2.0/firebase-database.js";
            import { getAuth, createUserWithEmailAndPassword, signOut, signInWithEmailAndPassword, onAuthStateChanged } from "https://www.gstatic.com/firebasejs/9.2.0/firebase-auth.js";

            const db = getDatabase();
            const auth = getAuth();

            const name = document.getElementById("<%=pName.ClientID%>").textContent
            set(ref(db, "CurrentMission/" + "curMission"), {
                ProjectName: name,
                Coordinate: "default"
            })

        </script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
</asp:Content>