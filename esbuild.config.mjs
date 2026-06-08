import { context } from "esbuild";
import coffeeScriptPlugin from "esbuild-coffeescript";

const isWatch = process.argv.includes("--watch");

const config = {
  entryPoints: ["app/javascript/application.js"],
  bundle: true,
  outdir: "app/assets/builds",
  sourcemap: true,
  format: "esm",
  publicPath: "/assets",
  loader: {
    ".woff": "file",
    ".woff2": "file"
  },
  plugins: [
    coffeeScriptPlugin({
      bare: true
    })
  ],
};

if (isWatch) {
  let ctx = await context(config);
  await ctx.watch();
  console.log("esbuild is watching for changes...");
} else {
  let ctx = await context(config);
  await ctx.rebuild();
  ctx.dispose();
}
