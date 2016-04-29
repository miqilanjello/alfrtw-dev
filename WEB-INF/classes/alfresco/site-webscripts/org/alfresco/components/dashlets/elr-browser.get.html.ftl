<p>NEW</p>
<@markup id="css" >
   <#-- CSS Dependencies -->
   <@link rel="stylesheet" type="text/css" href="${url.context}/res/jquery/themes/default/style.min.css" group="dashlets" />
</@>
<@markup id="js">
   <#-- JavaScript Dependencies -->
   <@script src="${url.context}/res/jquery/jquery-1.11.2.js" group="dashlets"/>
   <@script src="${url.context}/res/jquery/jstree.js" group="dashlets"/>
</@>
<@markup id="widgets">
   <@createWidgets group="dashlets"/>
</@>
<@markup id="html">
	<script type="text/javascript">
		//TODO:
		//	XML generation
		//	Download of items
		var refresh = true;
		function SendAjaxRequest(urlstring)
		{
			console.log("SendAjaxRequest");
			YAHOO.util.Connect.asyncRequest("GET", urlstring, 
			{ 
					success: function(response) {
						if(response.responseText.search('Error') != -1)
						{
							console.log("Во время выполнения действия возникла ошибка! Возможно, у Вас нет прав на выполнение данного действия. Обратитесь к администратору.");
							return null;
						}
						else
						{
							//var lala = eval('(' + response.responseText + ')');
							//console.log(lala);
							//var countPubmed = jsonUtils.toObject(response.responseText);
							//console.log(countPubmed);
							//return "LALALA";
							//console.log(countPubmed);
							var str = response.responseText;
							//console.log(str);
							//var newresponcestring = str.substr(1, str.length - 2);
							//console.log(newresponcestring);
							var newstr = str.split(':');
							//newstr[1] = newstr[1].substr(1, newstr.length - 2);
							var newstr2 = newstr[1].split('"');
							//console.log(newstr2[1]);
							return newstr2[1];
						}
					},
					failure: function(response) {
						console.log('failed...' + response.responseText);
				}
			}, 
			null);
		}
		//var prompt = new YAHOO.widget.SimpleDialog("prompt",
     // {
      //   draggable: true,
       //  modal: true,
        // visible: true,
		 
      //});
	   //prompt.cfg.setProperty("icon", YAHOO.widget.SimpleDialog.ICON_ALARM);
	   //prompt.show();
		new Alfresco.widget.DashletResizer("${args.htmlid}", "${instance.object.id}");
		new Alfresco.widget.DashletTitleBarActions("${args.htmlid}").setOptions(
	    {
		  actions:
		  [
			 {
				cssClass: "help",
				bubbleOnClick:
				{
				   message: "${msg("dashlet.elr.help")?js_string}"
				},
				tooltip: "${msg("dashlet.elr.help.tooltip")?js_string}"
			 }
		  ]
	    });

		function Plus_Click(p_oEvent) {
			id = Alfresco.util.generateDomId();
			 var Dom = YAHOO.util.Dom;
			//Alfresco.util.encodeURIPath("ЛАЛАЛА");
			 //$("#jstree_demo_div").jstree(true).refresh();
			 /*Alfresco.util.PopupManager.displayPrompt(
			 {
				title: "REFRESH TREE",
				text: "NOW!!!"
			 });*/
			 promt = Alfresco.util.PopupManager.getUserInput(
			 {
				title: "Форма ввода информации",
				html: '<label for="' + id + '">Подсказка для поля input</label><br/><br/><input id="' + id + '" tabindex="0" type="text" value="Только текст"/>',
				buttons: [
                         {
                            text: "Принять",
                            handler: function PdfJs__onGetDocumentFailure_okClick() {
                               // Grab the input, destroy the pop-up, then callback with the value
							   console.log(Dom.get(id).value);
							   this.destroy();
                            },
                            isDefault: true
                         },
                         {
                            text: "Отменить",
                            handler: function PdfJs__onGetDocumentFailure_cancelClick() {
                               this.destroy();
                            }
                         }
                      ]
				//value: "Only text",
				//callback:
				//{
				 //  fn: this.onPageRenamed,
				  // obj: [ sitePageTitleInputEl, sitePageTitleH3El],
				   //scope: this
				//}
			 });
			 okButton = promt.getButtons()[0];
			 YAHOO.util.Event.addListener(id, "keyup", function(event, okButton) {
                  if (okButton != null)
                  {
						//console.log('LALALALA');
						okButton.set("disabled", false);
                  }
               }, okButton);
			 new YAHOO.util.KeyListener(id, {
                  keys: [ YAHOO.util.KeyListener.KEY.ENTER ]
               }, function onPasswordEnter(e) {
                  //submitPassword(Dom.get(id).value);
                  promt.destroy();
               }).enable();
		}
		function onButtonReady() {
			var Plus = new YAHOO.widget.Button("Plus");
			var Minus = new YAHOO.widget.Button("Minus");
			var Othr = new YAHOO.widget.Button("Othr");
			Plus.on("click", Plus_Click);
			$('#jstree_demo_div').jstree({
				'types' : {
					'default' : {
						'icon' : '/share/res/components/images/filetypes/generic-file-32.png'
					},
					'doc' : {
						'icon' : '/share/res/components/images/filetypes/doc-file-32.png'
					},
					'empty_folder' : {
						'icon' : '/share/res/components/images/filetypes/generic-folderempty-new-32.png'
					},
					'folder' : {
						'icon' : '/share/res/components/images/filetypes/generic-folder-32.png'
					},
					'html' : {
						'icon' : '/share/res/components/images/filetypes/html-file-32.png'
					},
					'img' : {
						'icon' : '/share/res/components/images/filetypes/img-file-32.png'
					},
					'pdf' : {
						'icon' : '/share/res/components/images/filetypes/pdf-file-32.png'
					},
					'ppt' : {
						'icon' : '/share/res/components/images/filetypes/ppt-file-32.png'
					},
					'rtf' : {
						'icon' : '/share/res/components/images/filetypes/rtf-file-32.png'
					},
					'txt' : {
						'icon' : '/share/res/components/images/filetypes/txt-file-32.png'
					},
					'xls' : {
						'icon' : '/share/res/components/images/filetypes/xls-file-32.png'
					},
					'xml' : {
						'icon' : '/share/res/components/images/filetypes/xml-file-32.png'
					}
				},
				'core' : {
							'multiple' : false,
							'themes' : {
								'variant' : 'large'
							},
							'check_callback' : function (operation, node, parent, position, more) {
								if(node != null && parent != null)
								{
									console.log("lab1");
									var url = "NULL";
									switch(operation) // выбранное действие
									{
										case "create_node":
										{
											//console.log(node);
											//console.log(parent);
											if(parent.type == "folder" || parent.type == "empty_folder")
											{
												node.type = "empty_folder";
												node.parent = parent.id;
											}
											else
											{
												return false;
											}
											break;
										}
										case "copy_node":
										case "move_node":
										{
											if((node.parent != parent.id) && (node.id != parent.id) && (parent.type == "folder"  || parent.type == "empty_folder"))
											{
												url = Alfresco.constants.PROXY_URI + "file_repository/repository-operation?site=" + Alfresco.constants.SITE + "&action=" + operation + "&source=" + node.id + "&dest=" + parent.id;
												//$.jstree.reference('#jstree_demo_div').refresh_node(parent);
											}
											break;
										}
										case "delete_node":
										{
											url = Alfresco.constants.PROXY_URI + "file_repository/repository-operation?site=" + Alfresco.constants.SITE + "&action=" + operation + "&source=" + node.id;
											break;
										}
										default:
										{
											break;
										}
									}
									if(url != "NULL")
									{
										console.log("lab2");
										SendAjaxRequest(url);
									}
								}
							 },
							'data' : {
								'url' : Alfresco.constants.PROXY_URI + "file_repository/viewfiles?site=" + Alfresco.constants.SITE + "&userId=" + Alfresco.constants.USERNAME,
								'data' : function (node) {
									//if(node.text)
										//return { 'parent' : Alfresco.util.encodeURIPath("/" + node.text) };
									//else
										return { 'parent_uuid' : node.id};
								}
							}
				},
				"plugins" : [ "contextmenu", "types", "dnd" ]
			});
			
			// rename Node
			
			jQuery("#jstree_demo_div").bind("rename_node.jstree", function (e, data) { 
				//alert(data.text);
				//console.log(e);
				//console.log(data);
				console.log("lab3");
				var stringid = data.node.id;
				var strlength = stringid.length;
				//console.log(strlength);
				if(strlength == 36)	// fixed ID of Node 
				{
					var rename_url = Alfresco.constants.PROXY_URI + "file_repository/repository-operation?site=" + Alfresco.constants.SITE + "&action=rename_node" + "&source=" + data.node.id + "&dest=" + data.text;
					SendAjaxRequest(rename_url);
				}
				else	// new folder
				{
					var newfolderurl = Alfresco.constants.PROXY_URI + "file_repository/repository-operation?site=" + Alfresco.constants.SITE + "&action=create_node&source=" + data.text + "&dest=" + data.node.parent;
					SendAjaxRequest(newfolderurl);
					//console.log(newnode);
					//newnode.instance.refresh();
					//$("#jstree_demo_div").jstree(true).
					//data.instance.refresh_node(data.node);
					//var responcestring = SendAjaxRequest(newfolderurl);
					//data.node.id = responcestring;
					
					//console.log(responcestring);
				}
				
				var newnode = $.jstree.reference('#jstree_demo_div').get_node(data.node.parent);
				$.jstree.reference('#jstree_demo_div').refresh_node(newnode);
				
			}); 
			
			// open Node
			jQuery("#jstree_demo_div").bind("open_node.jstree", function (e, data) {
				if(!refresh)	// Block the recursion
				{
					//var newinfo = data.instance.get_node(data.node.id);
					data.instance.refresh_node(data.node);
					refresh = true;
				}
				else
					refresh = false;
			});
		}
		YAHOO.util.Event.onContentReady("Plus", onButtonReady);	// действия при загрузке компонента
	</script>

	<div class="dashlet elr-browser">
		<div class="title">${msg("elr.dashlet.header.default")}</div>
			<div class="toolbar flat-button" style="padding: 3px;">
			<button type="button" id="Plus"><img src="/share/res/components/images/plus-blue-16.png"
															  style="vertical-align:middle;"/>&nbsp;Развернуть</button>
			<button type="button" id="Minus"><img src="/share/res/components/images/minus-blue-16.png"
												  style="vertical-align:middle;"/>&nbsp;Свернуть</button>
			<button type="button" id="Othr"><img src="/share/res/components/images/remove-blue-16.png"
											  style="vertical-align:middle;"/>&nbsp;Очистить избранное</button>
			</div>
			<div class="body scrollableList" <#if args.height??> style="height: ${args.height}px;"</#if>>
			<div class="emptyclass">
				<div id="jstree_demo_div"></div>
			</div>
			</div>
	</div>
</@>