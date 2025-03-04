return {
  Generate = { prompt = "$input", replace = true },
  Chat = { prompt = "$input" },
  Summarize = { prompt = "Summarize the following text:\n$text" },
  Ask = { prompt = "Regarding the following text, $input:\n$text" },
  Change = {
    prompt = "Change the following text, $input, just output the final text without additional quotes around it:\n$text",
    replace = true,
  },
  Enhance_Grammar_Spelling = {
    prompt = "Modify the following text to improve grammar and spelling, just output the final text without additional quotes around it:\n$text",
    replace = true,
  },
  Enhance_Wording = {
    prompt = "Modify the following text to use better wording, just output the final text without additional quotes around it:\n$text",
    replace = true,
  },
  Make_Concise = {
    prompt = "Modify the following text to make it as simple and concise as possible, just output the final text without additional quotes around it:\n$text",
    replace = true,
  },
  Make_List = {
    prompt = "Render the following text as a markdown list:\n$text",
    replace = true,
  },
  Review_Code = {
    prompt = "Review the following code and make concise suggestions:\n```$filetype\n$text\n```",
  },
  Enhance_Code = {
    prompt = "Enhance the following code, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
    replace = true,
    extract = "```$filetype\n(.-)```",
  },
  Change_Code = {
    prompt = "Regarding the following code, $input, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
    replace = true,
    extract = "```$filetype\n(.-)```",
  },
  Make_Multiline = {
    prompt = "Reformat this code to be more readable using proper line breaks and indentation. Only output the reformatted code with no explanations:\n```$filetype\n$text\n```",
    replace = true,
    extract = "```$filetype\n(.-)```"
  },
  Fix_Syntax = {
    prompt = "Fix any syntax errors in this code. Only output the corrected code with no explanations:\n```$filetype\n$text\n```",
    replace = true,
    extract = "```$filetype\n(.-)```"
  },
  Refactor = {
    prompt = "Refactor this code to be more efficient and maintainable while preserving functionality. Consider:\n- Performance optimisations\n- Better variable/method names\n- Removing redundancy\n- Ruby best practices\nOnly output the refactored code with no explanations:\n```$filetype\n$text\n```",
    replace = true,
    extract = "```$filetype\n(.-)```"
  }
}
