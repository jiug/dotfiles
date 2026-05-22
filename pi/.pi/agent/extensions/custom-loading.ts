import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

export default function (pi: ExtensionAPI) {
  pi.on("session_start", async (_event, ctx) => {
    const asciiArt = `
          3.141592
        653589793
       23    84
      6 2    64
        3    38
        3    27
        9    50 2
      8 8    4197
       16     93
      `;
    
    ctx.ui.notify(`Loading pi...\n${asciiArt}`, "info");
  });
}
