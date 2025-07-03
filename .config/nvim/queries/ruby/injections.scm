(heredoc_body
  (heredoc_content) @injection.content
  (heredoc_end) @heredoc_lang
  (#match? @heredoc_lang "SQL")
  (#set! injection.language "sql")
)

(heredoc_body
  (heredoc_content) @injection.content
  (heredoc_end) @heredoc_lang
  (#match? @heredoc_lang "JSON")
  (#set! injection.language "json")
)

; Fallback dynamic injection (requires lowercase marker)
(heredoc_body
  (heredoc_content) @injection.content
  (heredoc_end) @injection.language)
