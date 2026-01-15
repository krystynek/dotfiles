import * as fs from "fs";
import { type KarabinerRule } from "./types.ts";
import { createHyperSubLayers, app, mandatoryModifiers } from "./utils.ts";

const mapTo = "right_shift";
const modifiers = mandatoryModifiers.filter((m) => m !== mapTo);
const hyperKeySetup: KarabinerRule = {
  // Define the Hyper key itself
  description: "Hyper Key (⌃⌥⇧⌘)",
  manipulators: [
    {
      description: "Caps Lock -> Hyper Key",
      from: {
        key_code: "caps_lock",
        modifiers: {
          optional: ["left_shift"],
        },
      },
      to: [
        {
          key_code: mapTo,
          modifiers,
        },
      ],
      to_if_alone: [
        {
          key_code: "left_control",
        },
      ],
      type: "basic",
    },
  ],
};

const rules: KarabinerRule[] = [
  hyperKeySetup,
  ...createHyperSubLayers({
    a: {
      // acts as ctrl + b  for TMUX
      to: [{ key_code: "b", modifiers: ["left_control"] }],
    },

    // ; = "Open" applications
    semicolon: {
      g: app("Google Chrome"),
      m: app("Microsoft Outlook"),
      o: app("Obsidian"),
      s: app("Slack"),
      t: app("Telegram"),
      v: app("Vivaldi"),
      z: app("zoom.us"),
    },

    // w = "Window" via rectangle.app
    w: {},

    // s = "System"
    s: {
      u: {
        to: [
          {
            key_code: "volume_increment",
          },
        ],
      },
      j: {
        to: [
          {
            key_code: "volume_decrement",
          },
        ],
      },
      i: {
        to: [
          {
            key_code: "display_brightness_increment",
          },
        ],
      },
      k: {
        to: [
          {
            key_code: "display_brightness_decrement",
          },
        ],
      },
      p: {
        to: [
          {
            key_code: "play_or_pause",
          },
        ],
      },
      semicolon: {
        to: [
          {
            key_code: "fastforward",
          },
        ],
      },
    },
    // QUICK ACCESS TO MOST USED APPS
    // has to be below the other layouts to not override them
    h: app("Zen Browser"),
    j: app("Vivaldi"),
    k: app("Kitty"),
    l: app("Visual Studio Code"),
  }),
];

fs.writeFileSync(
  "../karabiner.json",
  JSON.stringify(
    {
      global: {
        show_in_menu_bar: false,
      },
      profiles: [
        {
          name: "Default",
          virtual_hid_keyboard: { keyboard_type_v2: "ansi" },
          complex_modifications: {
            rules,
          },
        },
      ],
    },
    null,
    2,
  ),
);
