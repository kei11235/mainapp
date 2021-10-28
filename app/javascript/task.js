const buildHTML = (XHR) => {
  const item = XHR.response.task;
  const html = `
    <div class="task-content">
      ${item.content}
      <div class="task-delete">
        <%= link_to "削除", goal_task_path(params[:goal_id], t.id), method: :delete, class: "task-submit" %>
      </div>
    </div>`;
  return html;
};

function task() {

  const url = location.pathname;
  const res = url.replace(/[^0-9]/g, '');

  const submit = document.getElementById("task-submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", `/goals/${res}/tasks`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      };
      const list = document.getElementById("list");
      const formText = document.getElementById("content");
      list.insertAdjacentHTML("afterend", buildHTML(XHR));
      formText.value = "";
    };
  });
};

window.addEventListener('load', task);