#If _MyType <> "Empty" Then

Namespace My
    ''' <summary>
    ''' 웹 프로젝트용 My 네임스페이스에 사용할 수 있는 속성을 정의하는 데 사용되는 모듈입니다.
    ''' </summary>
    ''' <remarks></remarks>
    <Global.Microsoft.VisualBasic.HideModuleName()> _
    Module MyWebExtension
        Private ReadOnly s_Computer As New ThreadSafeObjectProvider(Of Global.Microsoft.VisualBasic.Devices.ServerComputer)
        Private ReadOnly s_User As New ThreadSafeObjectProvider(Of Global.Microsoft.VisualBasic.ApplicationServices.WebUser)
        Private ReadOnly s_Log As New ThreadSafeObjectProvider(Of Global.Microsoft.VisualBasic.Logging.AspLog)
        ''' <summary>
        ''' 호스트 컴퓨터에 대한 정보를 반환합니다.
        ''' </summary>
        <Global.System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
        Friend ReadOnly Property Computer() As Global.Microsoft.VisualBasic.Devices.ServerComputer
            Get
                Return s_Computer.GetInstance()
            End Get
        End Property
        ''' <summary>
        ''' 현재 웹 사용자에 대한 정보를 반환합니다.
        ''' </summary>
        <Global.System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
        Friend ReadOnly Property User() As Global.Microsoft.VisualBasic.ApplicationServices.WebUser
            Get
                Return s_User.GetInstance()
            End Get
        End Property
        ''' <summary>
        ''' Request 개체를 반환합니다.
        ''' </summary>
        <Global.System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
        <Global.System.ComponentModel.Design.HelpKeyword("My.Request")> _
        Friend ReadOnly Property Request() As Global.System.Web.HttpRequest
            <Global.System.Diagnostics.DebuggerHidden()> _
            Get
                Dim CurrentContext As Global.System.Web.HttpContext = Global.System.Web.HttpContext.Current
                If CurrentContext IsNot Nothing Then
                    Return CurrentContext.Request
                End If
                Return Nothing
            End Get
        End Property
        ''' <summary>
        ''' Response 개체를 반환합니다.
        ''' </summary>
        <Global.System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
         <Global.System.ComponentModel.Design.HelpKeyword("My.Response")> _
         Friend ReadOnly Property Response() As Global.System.Web.HttpResponse
            <Global.System.Diagnostics.DebuggerHidden()> _
            Get
                Dim CurrentContext As Global.System.Web.HttpContext = Global.System.Web.HttpContext.Current
                If CurrentContext IsNot Nothing Then
                    Return CurrentContext.Response
                End If
                Return Nothing
            End Get
        End Property
        ''' <summary>
        ''' Asp 로그 개체를 반환합니다.
        ''' </summary>
        <Global.System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
        Friend ReadOnly Property Log() As Global.Microsoft.VisualBasic.Logging.AspLog
            Get
                Return s_Log.GetInstance()
            End Get
        End Property
     End Module
End Namespace

#End If