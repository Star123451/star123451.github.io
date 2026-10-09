function updateTime() {
  const now = new Date();
  document.getElementById("time").innerText = now.toLocaleTimeString();
}

// edge and chrome both mention safari in ua
function getBrowserName() {
  const ua = navigator.userAgent;
  if (ua.includes("Firefox")) return "Firefox";
  if (ua.includes("Edg")) return "Edge";
  if (ua.includes("Chrome")) return "Chrome";
  if (ua.includes("Safari")) return "Safari";
  return "Unknown";
}

function getOS() {
  const ua = navigator.userAgent;
  if (ua.includes("Linux")) return "Linux";
  if (ua.includes("Windows")) return "Windows";
  if (ua.includes("Mac")) return "macOS";
  if (ua.includes("Android")) return "Android";
  if (ua.includes("iPhone")) return "iOS";
  return "Unknown";
}

document.getElementById("browser").innerText = getBrowserName();
document.getElementById("os").innerText = getOS();
document.getElementById("screen").innerText = screen.width + " x " + screen.height;
document.getElementById("window").innerText = window.innerWidth + " x " + window.innerHeight;
document.getElementById("online").innerText = navigator.onLine ? "Online" : "Offline";
document.getElementById("language").innerText = navigator.language;

updateTime();
setInterval(updateTime, 1000);
