function ltrim(str)
{
	while(str.charAt(0)==" ")
	{
		str=str.replace(" ","");
	}
	return str;
}
function rtrim(str)
{
	last=str.length-1;
	while(str.charAt(last)==" ")
	{
		str=str.substring(0,last);
		last--;
	}
	return str;
}
function trim(str)
{
	return ltrim(rtrim(str));
}
function fillok(str)
{
	if(trim(str).length>0)
		return true;
	else
		return false;
}
function isnum(val)
{
	if(fillok(val)==false)
		return false;
	if(isNaN(val)==true)
		return false;
	else
		return true;
}
function isint(val)
{
	if(fillok(val)==false)
		return false;
	if(isNaN(val)==true)
		return false;
	if(parseInt(val)==0)
		return false;
	if(parseInt(val)!=val)
		return false;
	return true;
}
function dateok(str)
{
	//var reg = /^((1[6789]|[2-9][0-9])[0-9]{2}-(0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))$|^((1[6789]|[2-9][0-9])[0-9]{2}-(0[469]|11)-(0[1-9]|[12][0-9]|30))$|^((16|[248][048]|[3579][26])00)|(1[6789]|[2-9][0-9])(0[48]|[13579][26]|[2468][048])-02-(0[1-9]|1[0-9]|2[0-9])$|^(1[6789]|[2-9][0-9])[0-9]{2}-02-(0[1-9]|1[0-9]|2[0-8])$/;
	var reg = /^([2][0]|[1][9])\d{2}\-([0]\d|[1][0-2])\-([0-2]\d|[3][0-1])$/;
	if(reg.test(str) == false)
		return false;
	else
		return true;
}
function showhide(divid)
{
	if(document.getElementById(divid).style.display=="none")
		document.getElementById(divid).style.display="";
	else
		document.getElementById(divid).style.display="none";
}
function toggleTarget(val)
{
	if(val=="c")
	{
		document.getElementById("c1").style.display="";
		document.getElementById("c2").style.display="";
		document.getElementById("e1").style.display="none";
		document.getElementById("e2").style.display="none";
	}
	else
	{
		document.getElementById("e1").style.display="";
		document.getElementById("e2").style.display="";
		document.getElementById("c1").style.display="none";
		document.getElementById("c2").style.display="none";
	}
}