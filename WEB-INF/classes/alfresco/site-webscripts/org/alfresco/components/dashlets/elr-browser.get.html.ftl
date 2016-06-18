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
		//	Show thumbl's of img
		var refresh = true;
		function SendAjaxRequest(urlstring)
		{
			if(urlstring != '' && urlstring != null)
			{
				YAHOO.util.Connect.asyncRequest("GET", urlstring,
						{
							success: function(response)
							{
								var jsonresponse = JSON.parse(response.responseText);
								if(jsonresponse.err > 0)
								{
									Alfresco.util.PopupManager.displayPrompt({
										title: "Ошибка",
										draggable: true,
										modal: true,
										close: true,
										effect: {
												effect: YAHOO.widget.ContainerEffect.FADE,
												duration: 0.15
											   },
										icon: YAHOO.widget.SimpleDialog.ICON_WARN,
										text: jsonresponse.status
									});
								}
								else
								{
									Alfresco.util.PopupManager.displayMessage({
										spanClass: "message",
										displayTime: 1.8,
										noEscape: true,
										text: '<img width="22" height="23" src="http://localhost:8080/share/res/components/profile/images/tick.png" style="vertical-align: middle;"> ' + jsonresponse.status
									});
									if(jsonresponse.uuid != null && jsonresponse.uuid != 'error')
									{
										var xml_link = window.location.protocol + "//" + window.location.host + Alfresco.constants.URL_PAGECONTEXT + "document-details?nodeRef=workspace://SpacesStore/" + jsonresponse.uuid;
										window.open(xml_link);
									}

								}
							},
							failure: function(response)
							{
								console.log('failed...' + response.responseText);
							}
						},
						null);
			}
		}
/*		var prompt = new YAHOO.widget.SimpleDialog("prompt",
      {
         draggable: true,
         modal: true,
         visible: true,
		 
      });
	   prompt.cfg.setProperty("icon", YAHOO.widget.SimpleDialog.ICON_ALARM);
	   prompt.show();*/
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
						'icon' : '/share/res/components/images/filetypes_new/_blank.png'
					},
					'doc' : {
						'icon' : '/share/res/components/images/filetypes_new/doc.png'
					},
					'empty_folder' : {
						'icon' : '/share/res/components/images/filetypes/generic-folderempty-new-32.png'
					},
					'folder' : {
						'icon' : '/share/res/components/images/filetypes/generic-folder-32.png'
					},
					'gif' : {
						'icon' : '/share/res/components/images/filetypes_new/gif.png'
					},
					'jpg' : {
						'icon' : '/share/res/components/images/filetypes_new/jpg.png'
					},
					'bmp' : {
						'icon' : '/share/res/components/images/filetypes_new/bmp.png'
					},
					'mp3' : {
						'icon' : '/share/res/components/images/filetypes_new/mp3.png'
					},
					'avi' : {
						'icon' : '/share/res/components/images/filetypes_new/avi.png'
					},
					'exe' : {
						'icon' : '/share/res/components/images/filetypes_new/exe.png'
					},
					'php' : {
						'icon' : '/share/res/components/images/filetypes_new/php.png'
					},
					'java' : {
						'icon' : '/share/res/components/images/filetypes_new/java.png'
					},
					'js' : {
						'icon' : '/share/res/components/images/filetypes_new/js.png'
					},
					'tiff' : {
						'icon' : '/share/res/components/images/filetypes_new/tiff.png'
					},
					'html' : {
						'icon' : '/share/res/components/images/filetypes_new/html.png'
					},
					'sql' : {
						'icon' : '/share/res/components/images/filetypes_new/sql.png'
					},
					'png' : {
						'icon' : '/share/res/components/images/filetypes_new/png.png'
					},
					'pdf' : {
						'icon' : '/share/res/components/images/filetypes_new/pdf.png'
					},
					'ppt' : {
						'icon' : '/share/res/components/images/filetypes_new/ppt.png'
					},
					'psd' : {
						'icon' : '/share/res/components/images/filetypes_new/psd.png'
					},
					'rtf' : {
						'icon' : '/share/res/components/images/filetypes_new/rtf.png'
					},
					'txt' : {
						'icon' : '/share/res/components/images/filetypes_new/txt.png'
					},
					'xls' : {
						'icon' : '/share/res/components/images/filetypes_new/xls.png'
					},
					'xlsx' : {
						'icon' : '/share/res/components/images/filetypes_new/xlsx.png'
					},
					'rar' : {
						'icon' : '/share/res/components/images/filetypes_new/rar.png'
					},
					'zip' : {
						'icon' : '/share/res/components/images/filetypes_new/zip.png'
					},
					'xml' : {
						'icon' : '/share/res/components/images/filetypes_new/xml.png'
					}
				},
				'core' : {
							'multiple' : false,
							'themes' : {
								'variant' : 'large'
							},
							'check_callback' : function (operation, node, parent, position, more) {
								url = "";
								if(node != null && parent != null)
								{
									switch(operation) // выбранное действие
									{
										case "create_node":
										{
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
									if(url != "" && url != null)
									{
										SendAjaxRequest(url);
									}
								}
							 },
							'data' : {
								'url' : Alfresco.constants.PROXY_URI + "file_repository/viewfiles?site=" + Alfresco.constants.SITE + "&userId=" + Alfresco.constants.USERNAME,
								'data' : function (node) {
										return { 'parent_uuid' : node.id};
								}
							}
				},
				"plugins" : [ "contextmenu", "types", "dnd"],
				"contextmenu" : {
						"items" : {
							"viewinrepository" : {
								"icon": "http://localhost:8080/share/res/components/documentlibrary/actions/document-view-content-16.png",
								"separator_before"	: false,
								"separator_after"	: true,
								"_disabled"			: false,
								"label"				: "Открыть в репозитории",
								"action"			: function (data) {
									var inst = $.jstree.reference(data.reference),
											obj = inst.get_node(data.reference), mw_link = "";
									if(obj.type == "folder" || obj.type == "empty_folder")
										mw_link = window.location.protocol + "//" + window.location.host + Alfresco.constants.URL_PAGECONTEXT +  "repository#filter=path|" + Alfresco.util.encodeURIPath("сайты/" + Alfresco.constants.SITE + "/" + obj.a_attr.path + "/" + obj.text);
									else
										mw_link = window.location.protocol + "//" + window.location.host + Alfresco.constants.URL_PAGECONTEXT + "document-details?nodeRef=workspace://SpacesStore/" + obj.id;
									window.open(mw_link);
								}
							},
							"changemetadate" : {
								"icon" : "http://localhost:8080/share/res/components/documentlibrary/actions/folder-edit-properties-16.png",
								"separator_before"	: false,
								"separator_after"	: true,
								"_disabled"			: false,
								"label"				: "Изменить свойства",
								"action"			: function (data) {
									var inst = $.jstree.reference(data.reference),
											obj = inst.get_node(data.reference);
									var metadatachange_link = window.location.protocol + "//" + window.location.host + Alfresco.constants.URL_PAGECONTEXT +  "edit-metadata?nodeRef=workspace://SpacesStore/" + obj.id;
									window.open(metadatachange_link);
								}
							},
							"create" : {
								"icon" : "http://localhost:8080/share/res/components/documentlibrary/images/folder-new-16.png",
								"separator_before"	: false,
								"separator_after"	: true,
								"_disabled"			: function (data) {
									var inst = $.jstree.reference(data.reference),
											obj = inst.get_node(data.reference);
									if(obj.type != "folder" && obj.type != "empty_folder")
										return true;
									else
										return false;
								},
								"label"				: "Создать папку",
								"action"			: function (data) {
									var inst = $.jstree.reference(data.reference),
											obj = inst.get_node(data.reference);
									inst.create_node(obj, {}, "last", function (new_node) {
										setTimeout(function () { inst.edit(new_node); },0);
									});
								}
							},
							"addfavorites" : {
								"icon" : "http://localhost:8080/share/res/components/images/star-selected_16x16.png",
								"separator_before"	: false,
								"separator_after"	: true,
								"_disabled"			: function (data) {
									var inst = $.jstree.reference(data.reference),
											obj = inst.get_node(data.reference);
									if(obj.type != "folder" && obj.type != "empty_folder")
										return true;
									else
										return false;
								},
								"label"				: "Добавить в избранное",
								"action"			: function (data) {
									var inst = $.jstree.reference(data.reference),
											obj = inst.get_node(data.reference);

								}
							},
							"deletefavorites" : {
								"icon" :
										"http://localhost:8080/share/res/components/images/star-deselected_16x16.png",
								"separator_before"	: false,
								"separator_after"	: true,
								"_disabled"			: function (data) {
									var inst = $.jstree.reference(data.reference),
											obj = inst.get_node(data.reference);
									if(obj.type != "folder" && obj.type != "empty_folder")
										return true;
									else
										return false;
								},
								"label"				: "Удалить из избранного",
								"action"			: function (data) {
									var inst = $.jstree.reference(data.reference),
											obj = inst.get_node(data.reference);

								}
							},
							"exportxml" : {
								"icon" : "http://localhost:8080/share/res/components/images/filetypes/xml-file-16.png",
								"separator_before"	: false,
								"separator_after"	: true,
								"_disabled"			: function (data) {
									var inst = $.jstree.reference(data.reference),
											obj = inst.get_node(data.reference);
									if(obj.type != "folder" && obj.type != "empty_folder")
										return true;
									else
										return false;
								},
								"label"				: "Экспорт в XML",
								"action"			: function (data) {
									var inst = $.jstree.reference(data.reference),
											obj = inst.get_node(data.reference);
									var xml_gen_url = Alfresco.constants.PROXY_URI +
											"file_repository/get-xml?folder_uuid=" + obj.id;
									SendAjaxRequest(xml_gen_url);
								}
							},
							"rename" : {
								"icon" : "http://localhost:8080/share/res/components/documentlibrary/actions/document-change-type-16.png",
								"separator_before"	: false,
								"separator_after"	: false,
								"_disabled"			: false, //(this.check("rename_node", data.reference, this.get_parent(data.reference), "")),
								"label"				: "Переименовать",
								"action"			: function (data) {
									var inst = $.jstree.reference(data.reference),
											obj = inst.get_node(data.reference);
									inst.edit(obj);
								}
							},
							"remove" : {
								"icon" : "http://localhost:8080/share/res/components/documentlibrary/actions/document-reject-16.png",
								"separator_before"	: false,
								"separator_after"	: false,
								"_disabled"			: false, //(this.check("delete_node", data.reference, this.get_parent(data.reference), "")),
								"label"				: "Удалить",
								"action"			: function (data) {
									var inst = $.jstree.reference(data.reference),
											obj = inst.get_node(data.reference);
									//if(confirm('Подтвердите удаление'))
									//{
										if(inst.is_selected(obj)) {
											inst.delete_node(inst.get_selected());
										}
										else {
											inst.delete_node(obj);
										}
									//}
								}
							},
							"ccp" : {
								"separator_before"	: true,
								"separator_after"	: false,
								"icon" :
										"http://localhost:8080/share/res/components/images/edit-inline-16.png",
								"label"				: "Изменить",
								"action"			: false,
								"submenu" : {
									"cut" : {
										"separator_before"	: false,
										"separator_after"	: false,
										"icon" :
												"http://localhost:8080/share/res/components/documentlibrary/actions/document-checkin-from-googledocs-16.png",
										"label"				: "Вырезать",
										"action"			: function (data) {
											var inst = $.jstree.reference(data.reference),
													obj = inst.get_node(data.reference);
											if(inst.is_selected(obj)) {
												inst.cut(inst.get_selected());
											}
											else {
												inst.cut(obj);
											}
										}
									},
									"copy" : {
										"icon" : "http://localhost:8080/share/res/components/documentlibrary/actions/document-copy-to-16.png",
										"separator_before"	: false,
										"separator_after"	: false,
										"label"				: "Копировать",
										"action"			: function (data) {
											var inst = $.jstree.reference(data.reference),
													obj = inst.get_node(data.reference);
											if(inst.is_selected(obj)) {
												inst.copy(inst.get_selected());
											}
											else {
												inst.copy(obj);
											}
										}
									},
									"paste" : {
										"separator_before"	: false,
										"_disabled"			: function (data) {
											return !$.jstree.reference(data.reference).can_paste();
										},
										"separator_after"	: false,
										"icon" :
												"http://localhost:8080/share/res/components/documentlibrary/actions/document-checkout-to-googledocs-16.png",
										"label"				: "Вставить",
										"action"			: function (data) {
											var inst = $.jstree.reference(data.reference),
													obj = inst.get_node(data.reference);
											inst.paste(obj);
										}
									}
								}
							}
						}
				}
			});
			
			// rename Node
			
			jQuery("#jstree_demo_div").bind("rename_node.jstree", function (e, data) { 
				//alert(data.text);
				//console.log(e);
				//console.log(data);
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
			<button type="button" id="Plus"><img src="/share/res/components/images/plus-16.png"
															  style="vertical-align:middle;"/>&nbsp;Раскрыть</button>
			<button type="button" id="Minus"><img src="/share/res/components/images/minus-16.png"
												  style="vertical-align:middle;"/>&nbsp;Свернуть</button>
			<button type="button" id="Othr"><img src="/share/res/components/images/remove-16.png"
											  style="vertical-align:middle;"/>&nbsp;Очистить избранное</button>
			</div>
			<div class="body scrollableList" <#if args.height??> style="height: ${args.height}px;"</#if>>
			<div class="emptyclass">
				<div id="jstree_demo_div"></div>
			</div>
			</div>
	</div>
</@>