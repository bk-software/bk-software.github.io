function parseGippety() {
  const input = document.getElementById("gippetyInput").value;
  const zip = new JSZip();
  const lines = input.split("\n");
  let currentDir = zip;
  let currentFile = null;
  let fileContent = [];

  document.getElementById("downloadOptions").innerHTML = ""; // Clear previous options

  lines.forEach((line, index) => {
    if (line.startsWith("<GIPPETY:FILE:")) {
      if (currentFile && fileContent.length > 0) {
        addFileToZip(currentDir, currentFile, fileContent.join("\n"));
        fileContent = [];
      }
      const endPos = line.indexOf(">");
      currentFile = line.substring(14, endPos);
    } else if (line.startsWith("<GIPPETY:DIR:")) {
      if (currentFile && fileContent.length > 0) {
        addFileToZip(currentDir, currentFile, fileContent.join("\n"));
        fileContent = [];
        currentFile = null;
      }
      const endPos = line.indexOf(">");
      const path = line.substring(13, endPos);
      currentDir = zip.folder(path);
    } else if (line === "<GIPPETY:END>") {
      if (currentFile && fileContent.length > 0) {
        addFileToZip(currentDir, currentFile, fileContent.join("\n"));
      }
      currentDir = zip;
      currentFile = null;
      fileContent = [];
    } else {
      fileContent.push(line);
    }
  });

  if (currentFile && fileContent.length > 0) {
    addFileToZip(currentDir, currentFile, fileContent.join("\n"));
  }

  globalZip = zip;
  showDownloadOptions();
}

function addFileToZip(dir, fileName, content) {
  dir.file(fileName, content);
  const link = document.createElement("a");
  link.href = `data:text/plain;charset=utf-8,${encodeURIComponent(content)}`;
  link.download = fileName;
  link.textContent = `Download ${fileName}`;
  document.getElementById("downloadOptions").appendChild(link);
  document
    .getElementById("downloadOptions")
    .appendChild(document.createElement("br"));
}

function showDownloadOptions() {
  const zipButton = document.createElement("button");
  zipButton.textContent = "Download ZIP";
  zipButton.onclick = function () {
    globalZip.generateAsync({ type: "blob" }).then(function (content) {
      downloadZip(content, "project.zip");
    });
  };
  document.getElementById("downloadOptions").appendChild(zipButton);
}

function downloadZip(blob, filename) {
  const a = document.createElement("a");
  a.href = URL.createObjectURL(blob);
  a.download = filename;
  document.body.appendChild(a);
  a.click();
  document.body.removeChild(a);
}
