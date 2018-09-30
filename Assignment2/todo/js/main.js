function done(obj) {
    //delete from todo list
    del(obj);

    var element = obj.parentNode.parentNode;
    element.removeChild(obj.parentNode);

    //add complete time
    var td1 = document.createElement("td");
    var now = new Date();
    var content1 = document.createTextNode((now.getMonth() + 1) + "/" + now.getDate() + "/" + (now.getYear() + 1900));
    td1.appendChild(content1);
    element.appendChild(td1);

    //add undo button
    var td2 = document.createElement("td");
    var content2a = document.createElement("a");
    content2a.setAttribute("onclick", "undo(this)");
    content2a.setAttribute("class", "btn btn-secondary done-fix");
    var content2 = document.createTextNode("Undo");
    content2a.appendChild(content2);
    td2.appendChild(content2a);
    element.appendChild(td2);

    //add to FinishedTable
    var Table = document.getElementById("FinishedTable");
    Table.appendChild(element);
}

function add(obj) {
    var element = obj.parentNode.parentNode.cloneNode(true);

    //add title
    var title = element.childNodes[1];
    var titleVal = document.getElementById("inputTitle").value;
    document.getElementById("inputTitle").value = "";
    title.removeChild(title.firstChild);
    var titlecontent = document.createTextNode(titleVal);
    title.appendChild(titlecontent);

    //add duetime
    var due = element.childNodes[3];
    var dueVal = document.getElementById("inputDue").value;
    document.getElementById("inputDue").value = "";
    due.removeChild(due.firstChild);
    var duecontent = document.createTextNode(dueVal);
    due.appendChild(duecontent);

    //remove add button
    var operations = element.childNodes[5];
    operations.removeChild(operations.childNodes[1]);

    //add done button
    var donea = document.createElement("a");
    donea.setAttribute("onclick", "done(this)");
    donea.setAttribute("class", "btn btn-success done-fix");
    var donecontent = document.createTextNode("Done");
    donea.appendChild(donecontent);
    operations.appendChild(donea);

    //add delete button
    var deletea = document.createElement("a");
    deletea.setAttribute("onclick", "del(this)");
    deletea.setAttribute("class", "btn btn-danger done-fix");
    var deletecontent = document.createTextNode("Delete");
    deletea.appendChild(deletecontent);
    operations.appendChild(deletea);

    //add element
    var Table = obj.parentNode.parentNode.parentNode;
    Table.insertBefore(element, obj.parentNode.parentNode);
}

function undo(obj) {
    //delete from FinishedTable
    del(obj);

    var element = obj.parentNode.parentNode;

    //delete complete time
    element.removeChild(element.childNodes[5]);

    //delete undo button
    var operations = element.childNodes[6];
    operations.removeChild(operations.childNodes[1]);

    //add done button
    var donea = document.createElement("a");
    donea.setAttribute("onclick", "done(this)");
    donea.setAttribute("class", "btn btn-success done-fix");
    var donecontent = document.createTextNode("Done");
    donea.appendChild(donecontent);
    operations.appendChild(donea);

    //add delete button
    var deletea = document.createElement("a");
    deletea.setAttribute("onclick", "del(this)");
    deletea.setAttribute("class", "btn btn-danger done-fix");
    var deletecontent = document.createTextNode("Delete");
    deletea.appendChild(deletecontent);
    operations.appendChild(deletea);

    //add to todo list
    var Table = document.getElementById("TodoTable");
    var add = document.getElementById("inputTitle").parentNode.parentNode;
    Table.insertBefore(element, add);
}

//delete task
function del(obj) {
    var Table = obj.parentNode.parentNode.parentNode;
    Table.removeChild(obj.parentNode.parentNode);
}
