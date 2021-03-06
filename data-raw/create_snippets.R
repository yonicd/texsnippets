x_begin <- c(
'\begin{abstract}',
'\begin{alltt}',
'\begin{array}{cols}',
'\begin{array}[pos]{cols}',
'\begin{bmatrix}',
'\begin{Bmatrix}',
'\begin{center}',
'\begin{description}',
'\begin{description}\\item',
'\begin{displaymath}',
'\begin{document}',
'\begin{enumerate}\\item',
'\begin{equation}',
'\begin{eqnarray}',
'\begin{figure}',
'\begin{figure}[placement]',
'\begin{figure*}',
'\begin{figure*}[placement]',
'\begin{filecontents}',
'\begin{filecontents*}',
'\begin{flushleft}',
'\begin{flushright}',
'\begin{footnotesize}',
'\begin{Huge}',
'\begin{huge}',
'\begin{itemize}',
'\begin{itemize}\\item',
'\begin{LARGE}',
'\begin{Large}',
'\begin{large}',
'\begin{list}{label}{spacing}',
'\begin{lrbox}',
'\begin{math}',
'\begin{matrix}',
'\begin{minipage}[position]{width}',
'\begin{minipage}{width}',
'\begin{normalsize}',
'\begin{picture}(width,height)',
'\begin{picture}(width,height)(xoffset,yoffset)',
'\begin{pmatrix}',
'\begin{quotation}',
'\begin{quote}',
'\begin{scriptsize}',
'\begin{small}',
'\begin{tabbing}',
'\begin{table*}',
'\begin{table*}[placement]',
'\begin{table}',
'\begin{table}[placement]',
'\begin{tabular}{cols}',
'\begin{tabular}[pos]{cols}',
'\begin{tabular*}{width}[pos]{cols}',
'\begin{tabular*}{width}{cols}',
'\begin{thebibliography}{widestlabel}',
'\begin{theindex}',
'\begin{theorem}',
'\begin{theorem}[optional]',
'\begin{tiny}',
'\begin{titlepage}',
'\begin{trivlist}',
'\begin{verbatim}',
'\begin{verbatim*}',
'\begin{Vmatrix}',
'\begin{vmatrix}',
'\begin{verse}')


x_end <- gsub('\\}(.*?)$','}',gsub('\begin','\\\\end',x_begin))
x_title <- gsub('^\begin','',x_begin)
x_begin <- gsub('\begin','\\\\begin',x_begin)

cat(sprintf('snippet ts_%s\n  %s\n  %s\n\n',x_title,x_begin,x_end),sep = '\n',file = 'inst/snippets.txt')
